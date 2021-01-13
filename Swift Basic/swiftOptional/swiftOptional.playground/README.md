# Optional
> 값이 있을 수도 있고, 없을 수도 있는 값


## Optional을 사용하는 이유??

- 전달 인자의 값이 잘못된 값일 경우 `nil` 을 반환하여 오류 처리.
- 변수 및 프로퍼티의 값이 비어있음(empty) 을 의미.
- 매개변수가 옵셔널일 경우, 매개변수를 굳이 넘겨도 되지 않는다(= 옵셔널 매개변수에는 값이 없어도 된다)

<br>

## Optional Binding

<br>
```swift
var height: Int? = 170
if let value = height, value >= 160 {
    print("wow")
}
```
- binding 에 여러 조건을 넣어줄 수 있음.(and 연산과 동일)
- 변수 `value` 는 if 구문 안에서만 사용할 수 있음.

<br>

## Optional Chaining

- 하위 `property` 에 `optional` 값이 있는지 연속적으로 확인하면서, 중간에 하나라도 발견하면 `nil` 을 `return` 하는 형식.
```swift
class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let sangwoo = Person()
if let roomCount = sangwoo.residence?.numberOfRooms {
    print("--> rooms: \(roomCount)")
} else {
    print("--> there are no rooms")
}
// there are no rooms
```
- `if let roomCount = sangwoo.residence?.numberOfRooms` : 옵셔널 체이닝
- `property` 를 통해 계속 체인처럼 이어진다. 즉, `sangwoo` 의 `residence` 가 `nil` 이 아니라면, 다음으로 넘어가 `residence` 의 `numberOfRooms` 를 확인함.
- `residence` 뒤에 `?` 가 붙은 이유는 residence 가 nil 을 반환할 수도 있고, 아닐 수도 있기 때문이다.

<br>

## Forced Unwrapping 을 사용하는 시기??

- 프로그램 구조상 Optional 값을 먼저 설정한 후, 그 값이 항상 있는 것이 명백한 경우에 사용.(즉, 값이 있다는 것을 확신할 수 있는 경우)
- `implicitly unwrapped optionals(암시적으로 언래핑된 옵셔널)` 라고 한다.
- 주로 Class 초기화 과정에서 사용, 인스턴스의 모든 값이 세팅되어있어야 한다.
- `@IBOutlet` 같은 변수는 연결했다는 것을 확실히 할 수 있기 때문에 `!` 를 사용한다.

<br>

## `if let`  vs  `guard let`

- #### `guard let`
  - `guard` 문의 `else` 코드 블록은 자신보다  **상위 코드 블록을 종료시키는 코드가 반드시 들어가게 된다.**
  - 코드 블록 종료시 `return`, `break`, `continue`, `throw` 등 제어문 전환 명령을 필수적으로 사용해야함.(전환 명령을 쓸 수 없는 상황에선 사용이 불가능함)
  - `if` 코드를 간결하고 읽기 좋게 구성 가능
  - 예외상황만을 처리하고 싶다면 `guard` 구문을 사용하는 것이 간편함.


- #### `if let`
  - `if let` 으로 `Optional binding` 된 상수 및 변수는 `if` 코드 블록 안에서만 사용 가능함.
 