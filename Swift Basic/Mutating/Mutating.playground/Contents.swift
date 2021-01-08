import UIKit

struct Info {
    let name : String
    let age : Int
    var phone : String
    
    mutating func changePhoneNumber(newNumber: String) {
        self.phone = newNumber
    }
}

var myInfo = Info(name: "석상우", age: 27, phone: "010-5696-2353")
print(myInfo)

myInfo.changePhoneNumber(newNumber: "114")
print(myInfo)
