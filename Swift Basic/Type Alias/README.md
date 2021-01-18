# Type Alias
- ### 존재하는 Type 에 대한 새로운 별칭을 사용함으로서 코드를 더 읽기쉽도록 하는 문법

- C언어의 `typedef` 와 비슷한 개념

<br>

## 기본 Type 
```swift
typealias Name = String

let name: Name = "sangwoo"
```

<br>

## 사용자 정의 

```swift
class Student {}

typealias Students = [Student]
var students: Students = []
```

<br>

## 클로저
```swift
// 일반적인 closure 매개변수
func test(completionHandler: (Void) -> (Void)) {}

// typealias를 통한 closure 매개변수
typealias closure = (Void) -> (Void)
func test(completionHandler: closure){}
```