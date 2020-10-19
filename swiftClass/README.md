# Class
  
### 1. Class 생성
- 변수 생성 후 반드시 [생성자]를 만들어야함
```swift
class person{
    var firstName : String  //stored property
    var lastName : String

    init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
    }

    var fullName : String{  //stored property의 값을 가공함. -> computed property
        return "\(firstName) \(lastName)"
    }
}
```
- 객체 생성
   - 첫번째는 Type명시 안한것, 두번째는 Type명시. 
   - 오히려 Type을 명시한 두번째가 더 가독성이 줄어듬.
```swift
  var personFirst = Person(firstName : "석", lastName : "상우")
  var personSecond : Person = Person(firstName: "석", lastName: "상우")
```
- Class는 mutating이 없다.
   - mutating? : struct 등에서 property의 값이 변경됐을 때 명시해줘야 오류 안생김.
