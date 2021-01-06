import UIKit

struct Person{
    var firstName : String{
        didSet{ //stored property에서만 가능.
                //value 바뀔 때 알아차릴 수 있다.
            print("didSet: \(oldValue) --> \(firstName)")
        }
//        willSet{ //바뀌기 직전에 일어남. willset -> didset
//            print("willSet : \(firstName) -> \(newValue)")
//        }
    }
    var lastName : String
    
    //나중에 접근했을 때 그제서야 시작됨
    lazy var isPopular : Bool = {
        if fullName == "석상우" {
            return true
        }
        else{
            return false
        }
    }()
    
    
    //computed property -> 읽기만 가능.
    var fullName : String {
        get{
            return "\(firstName) \(lastName)"
        }
        
        set{
            // set을 사용하면 computed property에 setting 할 수 있다.
            //components(separatedBy : 일정기준으로 자름)
            if let firstName = newValue.components(separatedBy:  " ").first{
                self.firstName = firstName
            }
            
            //새로운 값 들어오는애 = newValue
            if let lastName = newValue.components(separatedBy:  " ").last{
                self.lastName = lastName
            }
            //type property : 생성된 인스턴스와 상관 없이 struct, class의 type 자체의 속성을 정하고자 할 때 사용 [static]
            //객체와 상관없음.
        }
    }
    static let isAlien : Bool = false
}

var person = Person(firstName: "석", lastName: "상우")

//stored property
person.firstName = "전"
person.lastName = "민주"
person.fullName = "석상우"

person.isPopular //접근할 때 쓸 수 있게
