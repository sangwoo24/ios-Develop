# enum

> 관련된 값으로 이루어진 그룹을 공통의 형(Type) 으로 선언하여 `형 안정성(Type safety)` 을 보장해주는 형(Type) <br>
`1급 클래스 형(First-class type)` 이기 때문에 클래스가 갖는 `Computed Property` 나 메소드를 포함하는 것도 가능하며, `Initializer` 를 가지거나 확장도 할 수 있으며, 따라서 `Protocol` 을 따르도록 정의될 수 있다.

<br><br>

## enum의 특징?
- 관련 있는 값을 묶어둔 `Type`
- `Hashable Protocol` 을 따르는 모든 Type이 `rawValue` 로 지정 가능.
- `enum` 내의 `case` 들은 임의의 `Associate value` 를 가질 수 있고, `Associate value`의 Type에는 제한이 없다.
- `형 안정성`이 보장됨

<br><br>

## Basic

#### 1. 선언
```swift
enum Ramen: Int {
    case 신라면 = 1
    case 진라면, 너구리, 짜빠게티
    
    func print() -> String {
        switch self {
        case .신라면: return "신라면"
        case .진라면: return "진라면"
        case .너구리: return "너구리"
        case .짜빠게티: return "짜빠게티"
        }
    }
}
var sin : Ramen = Ramen.신라면
sin = .너구리
print(sin) // 너구리
```
- case 한줄로 선언 가능함
- 위 코드에서 `sin` 의 Type 이 명시 된 이후에는 `.너구리` 와 같이 값을 변경해줄 수 있다.
- 또한 위 코드에서 `rawValue(원시 값)` 은 `Int` 로 명시하였다. 
<br>

#### 2. rawValue

```swift
enum Ramen: Int {}
          // 👆🏻: [rawValue]
guard let ramen = Ramen(rawValue: 4) else { return }
print(ramen)  // 짜빠게티
```
- `rawValue` 의 Type이 명시되어있지 않다면, 각 `case` 는 `rawValue` 를 가질 수 없다. 
- `rawValue` 값을 이용해 `enum` 의 `case` 를 확인할 수 있다.
- 위 코드에서 `rawValue = 4` 에 해당되는 값이 없다면 `nil` 을 반환하므로, ramen은 `옵셔널` 이 된다.
- 선언되지 않은 rawValue가 있을 때 `암묵적 rawValue 선언` 으로 인해 `Int` type은 `rawValue` 값이 `1`씩 증가하며,  `String` type 은 `case` 값을 가진다.

<br>

#### 3. Associated Value
> 하나의 enum에서 여러 case마다 다른 값들을 갖을 수 있도록 해준다.

```swift
enum Barcode {
    case upc(Int)
    case qrCode(String)
}

var product : Barcode = .upc(100)
product = .qrCode("sangwoo")

switch product {
case .upc(let num):
    print("--> upc: \(num)")
case let .qrCode(code):
    print("--> qrCode: \(code)")
}
```
- 바코드 값은 1차원 바코드인 `upc` 와 2차원 바코드인 `qrCode` 로 나뉜다.
- 같은 `Barcode` 임에도 다른 두 개의 차원에 따른 바코드가 있을 수 있으므로 `case` 를 구분하여 모델링한다.
- `case .name(let ...)` == `case let .name(...)`

<br>

#### 4. 구현 실습
```swift
enum Temperature {
    case celcius(Double)    //섭씨
    case fernheit(Double)   //화씨
    case kelvin(Double)     //절대
    
    var celciusValue: Double {
        switch self {
        case let .celcius(value): return value 
        case let .fernheit(value): return (value - 32) * 5 / 9
        case let .kelvin(value): return value + 273
        }
    }
}

func getTemp(with temp: Temperature) -> Double {
    let value = temp.celciusValue
    return value
}

var t : Temperature = .fernheit(42)
print(getTemp(with: t))   // 5.5555...
```
- 온도 단위에 따라 값이 여러가지가 될 수 있을 경우, 한가지의 `enum` 으로 선언하여 처리할 수 있다.
- 적절히 확장하여 올바른 단위의 값을 항상 사용할 수 있게 한다 = `[type-safety]`
- enum case 의 Associated value 이기 때문에 항상 사용하기 전에 패턴 매칭을 통해 확인하게 된다.

<br>

## 결국 enum을 사용해야 하는 이유는??
- `Barcode` 에서와 `Temperature` 에서도 볼 수 있듯이, 하나의 값에 대해 여러가지의 표현 방식이 존재하는 경우 유용한 것 같다.
- 만일 `Barcode` 에서 `upc` 와 `qrCode` 에 대해 다른 struct 등으로 선언하였다면, 타입이 다르기 때문에 `upc -> qrCode` 로 값이 변경될 때에 추가적인 처리가 필요할 수 있다. 하지만 `enum` 을 사용한다면, 쉽게 확장이 가능할 뿐더러, `type-safety` 하게 만들어준다.