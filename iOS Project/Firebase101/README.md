# Firebase
> 직접 `서버` 를 구축하지 않아도 사용할 수 있도록 `Google` 에서 `서버` 자체를 `Service` 로 지원하는 **`클라우드 플랫폼`**. 직접 서버를 개발하지 않기 때문에 빠른 시간안에 App을 만들 수 있고, App의 프로토타입을 쉽게 제작할 수 있다.

<br>

## Firebase 가 App에서 무슨 역활??

![](https://images.velog.io/images/sangwoo24/post/4289d1d4-e0f8-47b5-a802-fd44704c0e7f/KakaoTalk_Photo_2021-01-07-23-02-25.png)

- 데이터 저장, 동기화, 인증, 데이터 분석, 테스팅... 등을 `Firebase` 가 수행해준다.
<Br>

- `Build better apps`  
    - 개발 속도를 향상시켜준다.
<br>

- `Improve app quality`
  - 앱 크래시를 관찰한 후, 어디서 문제가 발생하는지 확인
  - 앱 성능 모니터링
  - 테스트 제공
  - ...
<br>

- `Grow your app`
  - 이벤트 로깅을 통한 분석
  - 웹에서 설정하는 값에 따라서, 사용자들에게 다양한 경험을 시켜 줄 수 있는 기능
  - 고객의 반응 및 실험 테스팅
  - ...

<br><br>

## SDK?
> Software Development Kit 의 약자로, 소프트웨어 개발자가 특정한 응용 프로그램을 만들 수 있게 해주는 **개발 도구의 집합** 이다.

- `Swift` 에 있는 `UIKit` 는 `UI` 를 구성할 때 사용하는 개발 도구이다.

<br>

### Firebase iOS SDK
- `iOS` 에서 `Firebase` 의 기능을 사용하기 위해 필요한 개발 도구이다. 
- `Google` 에서 `Firebase` 를 사용하기 위해 필요한 개발 도구들을 미리 만들어두었고, 우리는 그것을 가져와 사용하면 된다.

<br>

### 그럼 외부 SDK는 어떻게 가져오지?
- **`cocoapods`** : `Ruby` 기반으로, 외부 개발도구 및 외부 라이브러리 관리 모듈을 가져올 수 있는 역활을 수행.

<br><br>

## iOS 에서 Firebase 사용법
> [Google Firebase Consol](https://console.firebase.google.com) 에서 Firebase 에 대한 구성 요소들을 생성한다.

<br><br>

## Realtime Database
> [Google Firebase Realtime Database](https://firebase.google.com/docs/database/ios/start) 에서 Firebase Realtime Database 를 설치 및 설정한다.

- 모든 설치 및 설정을 마친 후, Project 의 `Realtime Database` 에 들어간다.

![](https://images.velog.io/images/sangwoo24/post/edb115db-880c-449f-bb3c-c7078f863758/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-07%20%EC%98%A4%ED%9B%84%2011.33.48.png)

- Database 콘솔이 나온다. 현재는 값을 넣어놨기 때문에 여러 항목들이 보이지만, 처음 들어가면 비어있는 항목으로 나온다.

<br>

![](https://images.velog.io/images/sangwoo24/post/3407a01f-97b3-4dc7-9030-7cb5b0340f41/%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7%202021-01-07%20%EC%98%A4%ED%9B%84%2011.33.26.png)

- `read` 와 `write` 가 가능하도록 규칙을 설정한다.

<br><br>

## Database 다루기

### Fetch
```swift
func updateLabel() {
    db.child("firstData").observeSingleEvent(of: .value) { snapshot in
    }
}
```
- `firstData` 라는 `Key` 를 가진 Data의 value를 `Fetch` 한다.

<br>

### Save
```swift
func saveBasicTypes() {
    db.child("int").setValue(3)
    db.child("double").setValue(3.5)
    db.child("string").setValue("안냥하세요")
    db.child("array").setValue(["전","석","김","오"])
    db.child("dict").setValue(["id" : "석상우", "age" : 26, "city" : "경기광주"])
    saveCustomers()
}
```
- `Key` 값과 `Value` 값을 `child` 와 `setValue` 를 통해 저장한다.
- 저장이 가능한 Type은 `Int`, `Double`, `String`, `Array`, `Dictionary` 가 허용된다.

<br>

### Update
```swift
func updateBasicType() {
    db.updateChildValues(["int" : 6])
    db.updateChildValues(["double" : 6])
    db.updateChildValues(["string" : "hello"])
}
```
- `update` 할 `key` 와 `value` 를 `Dictionary` 형태로 전달한다.

<br>

### Delete
```swift
func deleteBasicType() {
    db.child("int").removeValue()
    db.child("double").removeValue()
    db.child("string").removeValue()
}
```
- 간단하게 `removeValue` 메소드를 통해 해당 `Key` 값에 있는 `value` 들을 제거한다.

<br>

## 결론 
- `iOS App` 과 `Firebase` 를 연동할 수 있도록 하였다.
- `Firebase` 의 기능중 하나인 `Realtime Database` 를 통해 `App` 과 `Database` 사이에서 송, 수신이 일어날 수 있도록 했다.
- `백엔드` 를 직접 구현 할 필요 없이 `Google` 에서 지원해주는 `Firebase` 서비스를 이용하면, 간단하게 서버과 통신할 수 있다.
