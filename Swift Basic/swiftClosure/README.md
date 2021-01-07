# Closure

## 클로저(Closure) 가 뭐지??

> 사용자의 코드 안에서 전달되어 사용할 수 있는 **"실행 가능한 코드블럭"** 으로 **일급 객체** 의 역활을 한다. 정의된 클로저는 전달 인자로 보낼 수 있고, 변수/상수 등으로 저장하거나 전달할 수 있으며, 함수의 반환 값이 될 수도 있다.

<br>

## 클로저 표현방식

- 함수는 클로저의 한 형태로, 이름이 있는 클로저이다.
- 클로저가 인자로 들어가 있는 형태(Ex. Sort)는 `Inline Closure` 라고 부른다.
- `in` 키워드는 클로저 인자와 반환 타입의 정의와 실제 클로저 코드를 분리하는 역활을 한다.

```swift
func getMultiple(a: Int, b: Int, calculatedNum: (Int, Int) -> Int) {
    print(calculatedNum(a,b))
}

getMultiple(a: 4, b: 10, calculatedNum: { (a: Int, b: Int) -> Int in
    return a * b
})  // 40
```
- 함수에 존재하는 `closure` 인자를 직접 구현.
- Type 이 잘 명시되어있지만, 코드를 보기 복잡해 보인다.

<br>

### 타입 유추
> 클로저는 문맥에 따라 타입을 유추할 수 있기때문에 타입과 반환 타입을 생략할 수 있다.

```swift
getMultiple(a: 10, b: 10, calculatedNum: {a, b in return a * b})
```
- `getMultiple` 메소드의 `closure` 인자는 `(Int, Int) -> Int` 로 알 수 있기 때문에 `closure` 에서 인자 및 반환타입을 생략할 수 있다.

<br>

### 단축 인자
> 인자 값을 축약해서 사용할 수 있다. **($0 부터 순서대로)**
```swift
getMultiple(a: 6, b: 10, calculatedNum: { return $0 * $1 })
```
- `in` 키워드와 인자가 생략되었다.

<br>

### 암시적 반환
> `closure` 가 반환 값을 갖고, 내부의 실행문이 한 줄이라면(단일 표현식 closure), **암시적으로 해당 실행문을 반환 값을 사용한다.**
```swift
getMultiple(a: 8, b: 10, calculatedNum: { $0 * $1 })
```

<br>

### 후행 클로저
> 긴 `closure` 표현식을 함수의 뒤에 표현하면, 괄호`"()"` 를 생략할 수 있다.
```swift
getMultiple(a: 10, b: 10) { $0 * $1 }
```

<br>

### 연산자 함수
> `closure` 는 매개변수 타입과 반환 타입이 **연산자를 구현한 함수의 모양과 동일하다면**, 연산자만 표기해도 사용 가능하다.

```swift
public func > <T: Comparable>(lhs: T, rhs: T) -> Bool

let reversed = name.sorted(by: >)
```
- `문자열 Type` 에서 사용되는 크기 비교 연산자를 사용하여 `closure` 를 구현할 수 있다.

<br><br><br>

## 클로저의 특성

### 값 캡쳐
- [The Swift Language Guide(한국어) - Capturing value ](https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures#capturing-values)

```swift
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()   // 10
incrementByTen()   // 20
incrementByTen()   // 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven() // 7

incrementByTen()   // 40
```
- 클로저는 특정 Context의 상수나 변수의 값을 캡쳐할 수 있다. (= 원본 값이 사라져도 `클로저` 내에서 값을 활용할 수 있다)
- `중첩 함수(nested function)` 으로 단순한 캡쳐를 구현할 수 있다.

<br>

```swift
func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
}
```
- 반환되는 `클로저` 의 형태이다. `runningTotal` 와 `amount` 가 없어도 돌아가는 이유는 이 두개의 값들이 `캡쳐링` 되어 메모리상에 존재하기 때문이다.
- 다른 `클로저` 를 생성하면, 그 `클로저` 고유의 메모리에 `runningTotal` 와 `amount` 의 값을 캡쳐링하기 때문에 다른 `클로저` 에서는 다른 값이 나오게 된다.
- **`클로저` 는 `참조 타입`** 이기 때문에 한 `클로저` 를 다른 두 상수나 변수에 할당하면, 같은 `클로저` 를 참조하게 된다. `C언어` 의 `함수 포인터` 와 비슷하다고 보면 된다.

<br>

### Escaping 클로저

- [The Swift Language Guide(한국어) - Escaping closure](https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures#escaping-closures)

```swift
var completionHandlers: [() -> Void] = []
func someFunctionWithoutEscapingClosure(handler: () -> Void) {
    handler()
}

func someFunctionWithEscapingClosure(handler: @escaping () -> Void) {
    completionHandlers.append(handler)
}
```
- 파라미터로 들어가는 `클로저` 는 **`함수 밖에서 실행되는 클로저`** 예를들어, 비동기로 실행되거나 `completionHandler` 로 사용되는 `클로저` 는 파라미터 Type 앞에 `@escaping` 이라는 키워드를 명시해야 한다.
- 함수를 호출하는 도중에 해당 함수 외부에 `클로저` 를 저장하기 위해서는 `@escaping` 이 필요하다.
- 위에 코드에서 보면, 함수 내에서 실행되는 `클로저` 는 `@escaping` 이 필요하지 않다. 
<br>

### Auto closure

- [The Swift Language Guide(한국어) - auto closure](https://jusung.gitbook.io/the-swift-language-guide/language-guide/07-closures#autoclosures)

```swift
var numbers = [1,2,3,4,5]

// auto closure 명시 x
func printwhichNumberWithoutAutoClosure(_ closure: () -> Int) {
    print("Which number? : \(closure())!")
}
printwhichNumberWithoutAutoClosure({ numbers.remove(at: 0) })

// auto closure 명시 o
func printWhichNumberWithAutoClosure(_ closure: @autoclosure () -> Int) {
    print("Which number? : \(closure())!")
}
printWhichNumberWithAutoClosure(numbers.remove(at: 0))
```
- `auto closure` 은 인자 값이 없으며, 다른 함수에 전달 인자로 사용할 수 있는 `클로저` 이다.
- `클로저` 를 실행시키기 전까지는 실제 실행이 되지 않는다. 따라서 복잡한 연산을 하는 곳에 쓰인다.

- `@autoclosure` 을 명시하게 되면, 위 코드에서 볼 수 있듯이, 인자로 `클로저`가 아닌 **`클로저가 반환하는 Type`** 을 넣어줄 수 있다. 따라서 `대괄호 {}` 가 필요하지 않다.
<br>

### Auto closure & Escaping closure

```swift
var closures : [() -> Void] = []
func autoAndEscapingClosure(closure : @autoclosure @escaping () -> Void) {
    // 인자로 들어온 closure는 함수 밖에서 사용되기 때문에 @escaping 처리
    closures.append(closure)
}

// 인자로 들어가는 closure는 @autoclosure 처리로 인해 closure가 실제로 사용될 때 지연 호출됨
autoAndEscapingClosure(closure: print("helloworld"))

// closure 호출
closures.first?()
```
- `@autoclosure` 와 `@escaping` 은 동시에 사용 가능하다.
- 함수 외에서 사용하면서, 실제 처리가 필요할 때 호출하기 때문에 두 가지 `case` 를 공통으로 만족한다.