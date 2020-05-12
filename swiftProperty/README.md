# Property

### 1. Stored Property
- class와 struct에서 사용
- 상수와 변수값을 인스턴스의 일부로 저장
- didSet : 값이 바뀔 때 알아차릴 수 있다.
- willSet : 값이 바뀌기 직전에 알게된다.
```swift
var firstName : String

var lastName : String{
    didSet{
        print("didSet: \(oldValue) --> \(firstName)")
    }
    willSet{
        print("willSet: \(firstName) --> \(newValue)")
    }
}
```

### 2. Computed Property
- 저장(store) 하기보다는 값을 연산.
- 그때그때 특정 연산을 수행하여 값을 반환
- set을 사용하면 computed property를 setting할 수 있다.
```swift

var fullName : String{
    get{
        return "\(firstName) \(lastName)"
    }
    set{
        if let firstName = newValue.components(separatedBy: " ").first{
            self.firstName = firstName
        }
    }
}
```
### 3. Type Property [static]
- 생성된 인스턴스와 상관 없이 struct, class의 type 자체의 속성을 정하고자 할때 사용.
```swift
static let isAlien : Bool = false
```
  
### 4. Lazy Property
- 나중에 접근했을 때 그제서야 시작됨
- 값이 사용되기 전까지는 값이 계산되지 않는 property
- 생성이 되지 않다가 사용할 때 생성되는 property
```swift
lazy var isPopular : Bool = {
    if fullName == "석상우"{
        return true
    }
    else{
        return false
    }
}()
```
  
