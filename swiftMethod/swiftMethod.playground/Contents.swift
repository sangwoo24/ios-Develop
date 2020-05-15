import UIKit

struct Lecture {
    var title : String
    var maxStudents : Int = 10
    var numberOfRegistered : Int = 0
    
    func remainSeats() -> Int{
        let remainSeates = lec.maxStudents - lec.numberOfRegistered
        return remainSeates
    }
    
    mutating func register(_ person : Int){
        //등록된 학생수 증가시키기
        numberOfRegistered += person //stored property 바꾼다라고 swift가 인식하므로 빨간색 -> mutating
    }
    
    static let target : String = "Anybody want to learn ios Develop"
    
    static func 소속학교이름() -> String{ //type method
        return "산기대"
    }
}

var lec = Lecture(title: "iOS bsic")


lec.register(4)
lec.remainSeats()
Lecture.target      //struct에 직접 관여
Lecture.소속학교이름()


//-------이미 만든 struct 에 method 추가시키기-------

struct Math{
    static func abs(_ value : Int) -> Int{
        if value > 0 {
            return value
        }
        else{
            return -value
        }
    }
}
Math.abs(-10)

extension Math{     //Math 확장
    static func sqaure(_ value : Int) -> Int{
        return value * value
    }
    static func half(_ value : Int) -> Int{
        return value/2
    }
}

var value : Int = 3

extension Int{
    func squre() -> Int{
        return self * self
    }
    func half() -> Int{
        return self/2
    }
}

value.squre()
value.half()

