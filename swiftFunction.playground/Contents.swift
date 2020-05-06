import UIKit

//함수
func add(_ a: inout Int, _ b: Int) -> Int{
    a += 1
    return a + b
}

func printResult(_ function : (inout Int, Int) -> Int, _ a : inout Int , _ b : Int){
    //함수는 한가지의 일만 수행하도록 작성하는게 좋은코드.
    a += 1
    let value = function(&a,b)
    print(value)
    print(type(of: value))
}
var value = 5
printResult(add, &value, 5)
