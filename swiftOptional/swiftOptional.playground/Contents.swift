import UIKit

//Optional (it let + guard)
func parsedInt(_ from : String){
    if let num = Int(from){
        print(num)
    }else{
        print("can't convert int")
    }
}
parsedInt("100")

func parseInt(_ from : String){
    guard let num = Int(from)else{
        print("can't convert int")
        return
    }
    print(num)
}

parseInt("100")
 
let myName : String?
myName = nil

let name : String = myName ?? "이름없음"


//1. 최애 음식이름을 담는 변수 작성(String optional)
//2. 옵셔널 바인딩을 이용해서 값을 확인해보기
//3. 닉네임을 받아서 출력하는 함수 만들기 (input : String optioanl)

var food : String?
food = "ramen"

if let myFood = food{
    print(myFood)
}
else{
    print("음식이 없는데요")
}

func printNicname(_ nicName : String?){
    guard let nicName = nicName else {
        print("이름이 없는데요")
        return
    }
    print(nicName)
}

printNicname(nil)
