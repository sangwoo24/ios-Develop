import UIKit


var scoreDic : [String : Int] = ["상우" : 100, "민주" : 90]
//var scoreDic : Dictionary<String , Int> = ["상우" : 100, "민주" : 90]

if let sangwooScore = scoreDic["상우"]{
    print(sangwooScore)
}else{
    print("점수없음")
}

//scoreDic = [:]
scoreDic.isEmpty
scoreDic.count

//기존사용자 update
scoreDic["상우"] = 0
print(scoreDic)

for(name , score) in scoreDic{
    print("\(name) \(score)")
}

for key in scoreDic.keys{
    print(key)
}


// 1. 이름 직업 도시에 대해 본인의 딕셔너리 만들기
// 2. 도시를 부산으로 변경
// 3. 딕셔너리 받아서 이름과 도시 print하는 함수 만들기

var myInfo : [String : [String]] = ["석상우" : ["학생","시흥"]]

myInfo["석상우"]![1] = "부산"
myInfo["석상우"]![1]


func printInfo(_ mydic : [String : [String]]){
    print(mydic)
    print("이름 : \(mydic)")
}

printInfo(myInfo)

var mydic : [String : String] = ["이름" : "석상우", "직업" : "학생", "도시" : "시흥"]

mydic["도시"] = "부산"

func printNameAndCity(_ dic : [String : String]){
    if let name = mydic["이름"] , let city = mydic["도시"]{
        print("이름 : \(name) 도시 : \(city)")
    }
    else{
        print("정보가 없습니다")
    }
}

printNameAndCity(mydic)
