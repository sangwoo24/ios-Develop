# 고차 함수(Higher-order function)

- ### 다른 함수를 전달인자로 받거나 함수실행의 결과를 함수로 반환하는 함수
- Swift 표준 라이브러리의 컨테이너 타입(`Array`, `Set`, `Dictionary`) 에서 사용가능
- 고차함수들은 서로 연결하여 사용할 수 있음.

<br>

## map
- 데이터를 변형하고자 할 때 사용. 기존 컨테이너의 값들은 변경되지 않고 새로운 컨테이너를 생성하여 반환한다.
- `for-in` 구문과의 차이점
  - 코드 재사용이 용이
  - 컴파일러 최적화 측면에서 성능이 높다.

```swift
let numbers: [Int] = [1,2,3,4,5]
let closure: (Int) -> String = { String($0) }

var stringNumbers = numbers.map{ String($0) }
stringNumbers = numbers.map(closure)
stringNumbers   // ["1", "2", "3", "4", "5"]
```


<br>

## filter
- 컨테이너 내부의 값들을 걸러서 추출하고자 할 때 사용한다. 인자로 전달되는 함수의 반환타입은 `Bool` 이다.
- `true` 면 값을 포함하고, `false` 면 값을 배제하여 새로운 컨테이너를 생성하여 반환한다.
```swift
// filter
var powOdds: [Int] = numbers.map{ $0 * $0 }.filter{ $0 % 2 != 0 }
powOdds   // [1, 9, 25]
```

<br>

## reduce
- 컨테이너 내부를 하나로 합쳐주는 기능을 한다.
- 첫 번째 매개변수를 통해 초깃값을 지정할 수 있다.
- 초깃값이 최초의 `$0` 으로 사용된다.
<br>

- `for-in` 구문 사용
    ```swift
    let numbers: [Int] = [2,8,15]
    var result: Int = 0

    for number in numbers {
        result += number
    }
    result  // 25
    ```

- `reduce` 사용
    ```swift
    let array: [Int] = [1,2,3]
    let stringArray: [String] = ["a","b","c"]

    var resultInt = array.reduce(10){ $0 + $1 }
    resultInt  // 16

    var resultString = stringArray.reduce("") { $0 + $1 }
    resultString
    ```