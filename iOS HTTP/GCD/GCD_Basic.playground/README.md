# GCD [Grand Central Dispatch]
> 멀티코어 환경에서 최적화된 프로그래밍을 지원하도록 애플이 개발한 FIFO 형식의 기술

<br>

## GDC의 특징
> - 동시성을 만족할 수 있게 해주는 API
> - 해야 할 일들(Code Block) 을 GCD에 넘기면 System에서 안전하게 수행시켜줌
> - `DispatchQueue` 가 Block(Task) 들을 관리
> - Queue에 작업을 보내면 그에 따른 스레드를 적절히 생성해서 분배해주는 방법

<br>

## DispatchQueue란?
> GDC에서 사용하는 Queue의 이름

<br>

### DispatchQueue의 종류
- Serial Queue : 한 번에 하나의 Task만 처리
    ```swift
    let serialQueue = DispatchQueue(label: "serial")
    ```
    <br>

- Concurrent Queue : 동시에 여러 개의 Task를 병렬로 처리
    ```swift
    let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    ```
<br>

### DispatchQueue의 동작 방식
- Sync : Task가 끝날 때 까지 기다린다

    ```swift
    concurrentQueue.sync {
        for i in 0..<5 {
            print("☃️\(i)")
        }
    }

    concurrentQueue.async {
        for i in 0..<5 {
            print("🍡\(i)") 
        }
    }
    ```
    <br>

- Async : Queue에 Task를 추가하고 다른 Task를 수행한다.
    ```swift
    concurrentQueue.async {
        for i in 0..<5 {
            print("☃️\(i)")
        }
    }

    concurrentQueue.async {
        for i in 0..<5 {
            print("🍡\(i)")
        }
    }
    ```
<br>

## MainQueue
- MainThread 에서 작동하는, 전역적으로 사용 가능한 `Serial Queue`
- UI 관련 작업, 사용자 인터렉션 등에 사용
- MainQueue를 `sync` 로 동작시킬 시 `Dead Lock` 이 된다
  > MainQueue는 `SerialQueue` 이기 때문에 Sync로 동작시키게 된다면 sync 외부의 event를 처리하던 queue는 멈추게 되고, 그 후 sync 내부의 Task를 수행시켜야 하는데, Serial이기 때문에 sync내부의 코드는 sync 외부의 코드가 완료되어야 실행될 수 있다. 따라서 sync 내부는 외부 코드의 끝을 기다리고, sync 외부는 내부 코드의 끝을 기다린다 = Deadlock
-  교착상태 발동조건 Code
    ```swift
    let myQueue = DispatchQueue(label: "test")
    myQueue.async {
        myQueue.sync {
        // 외부 블록이 완료되기 전에 내부 블록은 시작되지 않습니다.
        // 외부 블록은 내부 블록이 완료되기를 기다립니다.
        // deadlock
        }
    // 이 부분은 영원히 실행되지 않습니다.
    }
    ```

<br><br>


## GlobalQueue 
- UI 를 제외한 작업에서 사용하며, Concurrent Queue에 해당됨
- `Qos` 를 이용하여 우선순위 설정이 가능

### Qos
- 적합한 Qos를 지정하면, App이 responsive하고 에너지 효율이 좋아짐을 보장할 수 있음


1. UserInteractive : 즉각 반응해야 하는 작업으로 유저와의 상호작용 작업에 할당
2. UserInitiated : 사용자가 결과를 기다리는 작업에 할당(문서 열기, 버튼 액션)
3. Default : 기본값으로 사용
4. Utility : 수 초 ~ 수 분 걸리는 작업들에 사용(네트워킹, 파일 불러오기)
5. background : 사용자에게 당장 인식 될 필요가 없는 작업들(위치 업데이트, 영상 다운로드)
    ```swift
    DispatchQueue.global(qos: .userInitiated).async {
        // 진짜 핵중요, 지금 당장 해야하는 것
    }
    DispatchQueue.global(qos: .userInitiated).async {
        // 거의 바로 해줘야 할 것, 사용자가 결과를 기다린다
    }
    DispatchQueue.global(qos: .default).async {
        // 이건 굳이?
    }
    DispatchQueue.global().async {
        // == default
    }
    DispatchQueue.global(qos: .utility).async {
        // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는 것 : 네트워킹, 큰 파일 불러오기
    }
    DispatchQueue.global(qos: .background).async {
        // 사용자한테 당장 인식 될 필요가 없는것들 : 뉴스데이터 미리 받기, 위치 업데이트, 영상 다운로드
    }
    ```
<br><br>

## CustomQueue
- 직접 DispatchQueue를 생성하여 사용
- 많이 사용되지는 않음

    ```swift
    let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
    let serialQueue = DispatchQueue(label: "serial", qos: .background)
    ```
<br><br>

## 복합적인 사용

```swift
func downloadImageFromServer() -> UIImage {
    // Heavy Task
    return UIImage()
}
func updateImage(image : UIImage){

}

DispatchQueue.global(qos : .background).async {
    let image = downloadImageFromServer()
    DispatchQueue.main.async {
        // update UI
        updateImage(image : image)
    }
}
```

- image 를 받은 후 UI 를 update하기 위해 MainQueue를 사용