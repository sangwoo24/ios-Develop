import UIKit
//codeForEveryoneJoonwon+02@gmail.com

// closure = 이름이 없는 메소드(함수)
//구현부를 줄일 수 있다.
var multipleClosure : (Int, Int) -> Int = { $0 * $1 }



//이렇게쓰는게 best.
var myClosure: (Int, Int) -> Int = { a, b in
    return a * b
}
let num = multipleClosure(4,2)




//클로저를 함수 인자내에 넣는다
func operateTwoNum(a : Int, b : Int, operation : (Int, Int) -> Int) -> Int{
    let result = operation(a, b)
    return result
}
operateTwoNum(a: 4, b: 2, operation: myClosure)




//클로저를 바로만들기
//미리 정의할 필요 없이 그때그때 클로저를 구성해서 넣어도 된다.
operateTwoNum(a: 3, b: 2) {a , b in
    return a / b
}





//input이 없고 output만 있어도 가능
let voidClosure : () -> Void = {
    print("ios Develop")
}
voidClosure



//클로저는 scope벗어나도 사용가능함. -> Capturing Value
var count = 0
var inc = {
    count += 1
}

inc()   //inc 로 출력하면 안됨
count














