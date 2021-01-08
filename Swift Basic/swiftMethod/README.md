# Method
> 특정 타입의 클래스, 구조체, 열거형과 관련된 함수
- `인스턴스 메소드` : 특정 타입의 인스턴스에서 실행할 수 있는 메소드
- `타입 메소드` : 특정 형과 관련된 메소드
- `C` 와 `Objective-c` 는 `클래스` 타입의 메소드만 선언할 수 있지만, `Swift` 에서는 `클래스`, `구조체`, `열거형` 에서도 선언할 수 있다.

<br>

## 인스턴스 메소드
- 특정 클래스, 구조체, 열거형의 인스턴스에 속한 메소드
- 인스턴스 내의 값을 제어할 수 있다.
- 해당 인스턴스가 속한 Type 의 인스턴스에서만 실행 가능하다.

```swift
class Counter {
    var count = 0

    func increment() {
        count += 1
    }
    func reset() {
        count = 0
    }
}
```
<br>

- #### Self property
  - 모든 프로퍼티는 암시적으로 인스턴스 자체를 의미하는 `self` 라는 프로퍼티를 갖는다. 인스턴스 메소드 안에서 `self` 프로퍼티를 이용해 인스턴스 자체를 참조하는데 사용할 수 있다.

<br>

## 타입 메소드
- 특정 타입 자체에서 호출해 사용하는 메소드.
- 타입 프로퍼티와 유사한 방식으로 `static` 혹은 `class` 를 붙혀 사용한다.
  - `static` : 서브 클래스에서 `override` **[ X ]**
  - `class` : 서브 클래스에서 `override` **[ O ]**
```swift
class SomeClass {
    class func someTypeMethod() {
        // 타입 메소드 구현
    }
}
SomeClass.someTypeMethod()    // 타입 메소드 호출!
```