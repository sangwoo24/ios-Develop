import UIKit


struct PersonStruct{
    var firstName : String
    var lastName : String
    
    var fullName : String{
        return "\(firstName) \(lastName)" //computed property
    }
    
    mutating func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}

class Person {
    var firstName : String
    var lastName : String
    
    // 다른방식의 변수 초기화 -> 생성자(init) -> struct에서도 생성자 만들 수 있음.
     init(firstName : String, lastName : String){
        self.firstName = firstName
        self.lastName = lastName
     }
     
    
    var fullName : String{
        return "\(firstName) \(lastName)" //computed property
    }
    
    func uppercaseName(){                 //class 에서는 mutating 사용 안함
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
}


var personFirst = Person(firstName : "석", lastName : "상우")
var personSecond : Person = Person(firstName: "석", lastName: "상우")
