import Foundation

let num1 = [1,2,3]
let num2 = [2]

let x = num1.filter({num2.contains($0)})
print(x)
