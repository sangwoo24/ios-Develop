# Protocol

- #### 특정 작업 혹은 기능들을 구현하기 위한 메소드, 프로퍼티, 다른 요구사항들의 `청사진` 이다.


-  청사진??
    ```
    미래에 대한 희망적인 계획·구상 등의 비유.
    ```

- `Java` 의 `Interface` 와 비슷한 기능.
- 최소한으로 가져야 할 속성이나 메소드를 정의한다. 구현은 하지 않고 `오로지 정의` 만 한다.

<br>

## protocol 기본 구성
```swift
protocol Sendable {
    var from: String { get }
    var to: String? { get set }
    
    func send()
}

struct Mail: Sendable {
    var from: String
    var _to: String?
    var to: String? {
        get {
            return self._to
        }
        set {
            self._to = newValue
        }
    }
    
    func send() {
        print("Send a mail [from]: \(self.from) [to]: \(self.to ?? "Nobody")")
    }
}

func sendAnything(_ sendable: Sendable) {
    sendable.send()
}

var mail = Mail(from: "tjrtkddnaos@naver.com")
mail.to = "tjtkddn24@kpu.ac.kr"
sendAnything(mail)
```
- `{ get }` 으로 지정할 시, `{ get }` 과 `{ get set }` 둘 중 하나만 구현해도 된다.
  - `{ set }` 만 구현할 수는 없다.
- `{ get set }` 으로 지정할 시, `{ get set }` 모두 구현해야 한다.
<br>

- `get{}`, `set{}` 은 해당 프로퍼티에 직접 붙어있기 때문에 `get{}`, `set{}` 에서 직접 프로퍼티에 접근하게 되면 `recursive` 하게 자기 자신의 `get`, `set`을 호출하기 때문에, 실제 값을 저장할 `backing storage` 가 필요하다.

  ```swift
  var _property: Int
  var property: Int {
      get {
          return _property
      }
      set {
          _property = newValue
      }
  }
  ```
  - `_property` 는 실제 값이 저장되는 변수이다. 즉, `property` 는 `_property` 의 `interface` 역할을 한다.

<br>

## 선택적인 메소드 구현
```swift
@objc protocol Myprotocol {
    //...
    @objc optional func doSomething()
}
```
- 선택적인 메소드 구현을 위해선 `@objc` 키워드와 optional 을 이용한다.