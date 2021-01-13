# Mutating
- ### 구조체 또는 열거형에서 내부 프로퍼티를 수정할 때 사용

<br>

```swift
struct Info {
    let name : String
    let age : Int
    var phone : String
    
    mutating func changePhoneNumber(newNumber: String) {
        self.phone = newNumber
    }
}
```
- `mutating` 을 붙히지 않고 사용하게되면, `컴파일 에러` 가 발생한다.
- 다른 구조체 `API` 를 보고 `Mutating` 의 여부에 따라, 원래 구조체 내부의 값을 변경하는 `API` 인지 아닌지 유추할 수 있다.