import UIKit



var mutipleClosure = {(a: Int, b: Int) -> Int in
    return a * b
}

func getMultiple(a: Int, b: Int, calculatedNum: (Int, Int) -> Int) {
    print(calculatedNum(a,b))
}

getMultiple(a: 2, b: 10, calculatedNum: { (a: Int, b: Int) -> Int in
    return a * b
})

// 타입 생략
getMultiple(a: 4, b: 10, calculatedNum: {a, b in return a * b})

// 단축 인자
getMultiple(a: 6, b: 10, calculatedNum: { return $0 * $1 })

// 암시적 반환
getMultiple(a: 8, b: 10, calculatedNum: { $0 * $1 })

// 후행 클로저
getMultiple(a: 10, b: 10) { $0 * $1 }


// closure 출력
var myClosure : () -> Void = {
    print("helloworld")
}


myClosure
myClosure.self
myClosure()


// @escaping
var completionHandlers: [() -> Void] = []
func someFunctionWithoutEscapingClosure(handler: () -> Void) {
    handler()
}

func someFunctionWithEscapingClosure(handler: @escaping () -> Void) {
    completionHandlers.append(handler)
}



var numbers = [1,2,3,4,5]

// non - auto closure
func printwhichNumberWithoutAutoClosure(_ closure: () -> Int) {
    print("Which number? : \(closure())!")
}
printwhichNumberWithoutAutoClosure { numbers.remove(at: 0) }

// auto closure
func printWhichNumberWithAutoClosure(_ closure: @autoclosure () -> Int) {
    print("Which number? : \(closure())!")
}
printWhichNumberWithAutoClosure(numbers.remove(at: 0))




// autoclosure & escaping
var closures : [() -> Void] = []
func autoAndEscapingClosure(closure : @autoclosure @escaping () -> Void) {
    // 인자로 들어온 closure는 함수 내에서 사용되지 않기 때문에 @escaping 처리
    closures.append(closure)
}

// 인자로 들어가는 closure는 @autoclosure 처리로 인해 closure가 실제로 사용될 때 지연 호출됨
autoAndEscapingClosure(closure: print("helloworld"))

// closure 호출
closures.first?()
