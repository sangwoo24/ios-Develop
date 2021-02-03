import UIKit

class FirstView {
    func someTodo() {
        let secondView = SecondView()
        secondView.completion = { string in
            print(string)
        }
    }
}


class SecondView {
    var completion: ((String) -> (Void))?
    init() {
        print("second view init")
        self.someTodo()
    }
    
    func someTodo() {
        self.completion?("hello")
    }
}


let firstView = FirstView()
firstView.someTodo()
