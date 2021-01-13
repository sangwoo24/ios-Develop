import UIKit

func swapValue<T>(firstValue a : inout T, secondValue b : inout T) {
    let temp = a
    a = b
    b = temp
    print("a: \(a), b: \(b)")
}


class SomeClass {}
protocol SomeProtocol {}

func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // body
}


func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
