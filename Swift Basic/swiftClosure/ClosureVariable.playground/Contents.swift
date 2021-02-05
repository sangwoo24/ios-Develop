import UIKit

class ClosureTest {
    var stringToInt: ((String) -> (Int)) = { str in
        guard let num = Int(str) else { return 0 }
        return num
    }
    
    func someTodo() {
        print(self.stringToInt("1"))
    }
    
    func mod(num1: Int, num2: Int, completion: ((Int, Int) -> (Int))) -> Int {
        return completion(num1, num2)
    }
}

let test = ClosureTest()
test.someTodo()
print(test.mod(num1: 10, num2: 3) { $0 % $1 })
