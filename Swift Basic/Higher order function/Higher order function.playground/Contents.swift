import UIKit


// map
let numbers: [Int] = [1,2,3,4,5]
let closure: (Int) -> String = { String($0) }

var stringNumbers = numbers.map{ String($0) }
stringNumbers = numbers.map(closure)
stringNumbers



// filter
var powOdds: [Int] = numbers.map{ $0 * $0 }.filter{ $0 % 2 != 0 }
powOdds


// reduce
let array: [Int] = [1,2,3]
let stringArray: [String] = ["a","b","c"]

var resultInt = array.reduce(10){ $0 + $1 }
resultInt  // 16

var resultString = stringArray.reduce("") { $0 + $1 }
resultString
