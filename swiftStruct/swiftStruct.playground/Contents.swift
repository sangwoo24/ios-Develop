import UIKit

//object = data + method    [Struct vs Class]
//Struct : Stack , Class : Heap

/*
func distance(current : Location, target : Location) -> Double{
    let disX = Double(target.x - current.x)
    let disY = Double(target.y - current.y)
    return sqrt(pow(disX, disX) + pow(disY,disY))
}
struct Location {
    let x : Int
    let y : Int
}
struct Store{
    let loc : Location
    let name : String
    let deliveryRange = 2.0
    
    func isDeliverable(useLoc : Location) -> Bool{
        let distanceToStore = distance(current: useLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}

let current = Location(x : 0, y : 0)
let store1 = Store(loc : Location(x : 2, y : 3), name : "gs")
let store2 = Store(loc : Location(x : 5, y : 6), name :"school")
let store3 = Store(loc : Location(x : 4, y : 4), name : "bus station")

let stores = [store1,store2,store3]



func printCloserStore(currentLocation : Location, stores : [Store])
{
    var minDistance = Double.infinity
    var minDistanceStore : String? = ""
    var isDeliverable = false
    
    for stores3 in stores{
        let calculateDistance = distance(current: currentLocation, target: stores3.loc)
        if(calculateDistance < minDistance){
            minDistance = calculateDistance
            minDistanceStore = stores3.name
            isDeliverable = stores3.isDeliverable(useLoc : current)
        }
    }
    if let closerStore = minDistanceStore{
        print("close store : \(closerStore) isDeliverable : \(isDeliverable)")
    }
    else{
        print("there are no way")
    }
}

printCloserStore(currentLocation : current, stores: stores)
*/

// 1. 강의이름, 강사이름, 학생수를 가지는 struct 만들기
// 2. 강의 array와 강사이름을 받아서 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기


//CustomStringConvertible -> 프로토콜
struct Lecture : CustomStringConvertible {
    var description: String{
        return "Title : \(lectureName), Instructor : \(professorName)" //-> Computed property 값을 저장하는게아니라 저장된정보를 가공 혹은 제공
    }
    var lectureName : String
    var professorName : String
    var studentNum : Int
}

func printLectureName(lecture : [Lecture], professorName : String){
    for name in lecture{
        if(professorName == name.professorName)
        {
            print("강의 이름은 : \(name.lectureName)")
        }
    }
}


let lecture1 = Lecture(lectureName: "자바",professorName: "김평수",studentNum: 40)
let lecture2 = Lecture(lectureName: "전자회로",professorName: "정두희",studentNum: 40)
let lecture3 = Lecture(lectureName: "운영체제",professorName: "김수민",studentNum: 40)

let lectures = [lecture1,lecture2,lecture3]

printLectureName(lecture: lectures, professorName: "김수민")

print(lecture1)




/*struct Store{
    let loc : Location       -> Stored property 직접 값을 저장.
    let name : String
    let deliveryRange = 2.0
    }
}*/
