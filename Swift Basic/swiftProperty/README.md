# Property
> 클래스, 구조체, 열거형과 관련한 값.

<br>

### 1. Stored Property
- `class` 와 `struct` 에서 사용
- `상수[let]` 와 `변수[var]` 값을 인스턴스의 일부로 저장
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

<br>

### 2. Computed Property
- 저장(store) 하기보다는 값을 연산.
- 그때그때 특정 연산을 수행하여 값을 반환
- 실제 값을 저장하는 것이 아니라 `getter` 와 `optional 한 setter` 를 제공해 값을 탐색하고 간접적으로 다른 프로퍼티의 값을 설정할 수 있는 방법을 제공.

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

<br>

### 3. Type Property 
- 생성된 인스턴스와 상관 없이 struct, class의 type 자체의 속성을 정하고자 할때 사용.
- 일반적으로 **`static`** 형과, 서브 클래스에서 `overriding` 이 가능한 **`class`** 형이 존재한다.
```swift
static let isAlien: Bool = false

class var isHuman: Bool {
    return true
}

Counter.isAlien     // false
Counter.isHuman     // true
```
  
<br>

### 4. Lazy Property
- 실제 property 가 사용 되기 전까지는 계산되지 않는 property
- property 가 특정 요소에 의존적이여서 그 요소가 끝나기 전에는 적절한 값을 알지 못하는 경우에 유용.
- 복잡한 계산이나 부하가 많이 걸리는 작업을 Lazy property 로 선언할 시 효과적이다.
- 초기에는 값이 존재하지 않고 이후에 값이 결정되기 때문에 `let` 으로는 선언할 수 없다.
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

<br>

### 5. Property Observers
- `Property` 는 새로운 값이 설정 될 때마다 이벤트를 감지할 수 있는 옵저버가 있다.
- `Lazy property` 에서는 사용할 수 없고, `Computed property` 에서는 `setter` 가 `observer` 역활을 한다.

```swift
class Counter {
    var total : Int = 0 {
        willSet {
            print("--> 들어온 값: \(newValue)")
        }
        didSet {
            print("--> 변경 후 total: \(total), 이전 total: \(oldValue)")
        }
    }
}

var cnt = Counter()
cnt.total = 100

// 들어온 값: 100 
// 변경 후 total: 100, 이전 total: 0
```

⭐️ `전역 상수` 와 `전역 변수` 는 `lazy property` 와 동일하게 `lazy computed` 되지만 `lazy property` 와는 다르게 `lazy` 키워드를 쓸 필요가 없다. 반면, `지역 상수` 와 `지역 변수` 는 `lazy computed` 될 수 없다.

<br>

