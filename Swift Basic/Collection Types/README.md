# Collection Types
- 각 Type 에 대해 사용해본 메소드 또는 프로퍼티를 계속 추가할 예정.

<br>

## Array

```swift
// 0으로 초기화된 배열 생성
var num = Array(repeating: 0, count: 5)
var num2 = Array(repeating: 0, count: 5)

// sequence로 배열 생성
var a = Array(0...1)

// 배열 합 가능
print(num + num2)

// 배열 slice
print(num[0..<3])

// empty 확인
num.isEmpty

// insert
num.insert(100, at: 0)

// remove
num.remove(at: 0)

// enumerated
for (index, value) in num.enumerated() {
    print("index: \(index), value: \(value)")
}
```

<br><br>

## Set
- `set` 형태로 저장되기 위해서는 타입은 반드시 `hashable` 이어야만 한다.
  - `hashable` : String, Int, Double, Bool ...

```swift
// set 생성
var set = Set<Int>()

// insert
set.insert(0)

// Array to Set
var num = [1,1,2,2,3,3]
var numToSet = Set(num)

// remove
numToSet.remove(4) //nil
numToSet.remove(0)

// contains
numToSet.contains(0)


// 집합 관련
var union = set.union(numToSet)
var intersection = set.intersection(numToSet)
var subtracting = set.subtracting(numToSet)

// 대칭자 : 둘 중 한 집합에는 속하지만 둘 모두에는 속하지 않는 원소들의 집합
var difference = set.symmetricDifference(numToSet)
```
  

<br><br>

## Dictionary

- `key`, `value` 형태로 `Dictionary` 선언
- `Dictionary` 의 return 값은 `Optional` 이다.

```swift
var myInfo : [String : [String]] = ["석상우" : ["학생","시흥"]]

myInfo["석상우"]![1] = "부산"
myInfo["석상우"]![1]


func printInfo(_ mydic : [String : [String]]){
    print(mydic)
    print("이름 : \(mydic)")
}

printInfo(myInfo)

var mydic : [String : String] = ["이름" : "석상우", "직업" : "학생", "도시" : "시흥"]

mydic["도시"] = "부산"

func printNameAndCity(_ dic : [String : String]){
    if let name = mydic["이름"] , let city = mydic["도시"]{
        print("이름 : \(name) 도시 : \(city)")
    }
    else{
        print("정보가 없습니다")
    }
}

printNameAndCity(mydic)
```