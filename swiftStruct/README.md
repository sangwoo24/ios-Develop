swift5 Struct
==============

### Struct vs Class
  
  1. Struct
  - Stack에 저장됨(속도빠름)
  - call by value(할당 또는 파라미터 전달시 value copy가 일어남)
    - data locality : 히트율이 높다
  ```swift
  struct st1{var name = "상우"}
  struct st2 = st1
  st2.name = "메롱"
  print(st1.name) //"상우"
 ```
 1. Class
 - Heap에 저장됨(속도느림)
 - call by reference(할당 또는 파라미터 전달시 객체를 가리키고 있는 메모리 주소값만 복사됨)
   - memory fragmentation 등의 overhead가 존재
  ```swift
  class c1{var name = "상우"}
  class c2 = c1
  c2.name = "메롱"
  print(c1.name) //"메롱"
  ```

  ### 기본문법예제
  ```swift
func distance(current : Location, target : Location) -> Double{
    let disX = Double(target.x - current.x)
    let disY = Double(target.y - current.y)
    return sqrt(pow(disX, disX) + pow(disY,disY))
}   //x, y값으로 distance를 구하는 함수

struct Location {
    let x : Int
    let y : Int
}   //좌표를 나타내는 함수 

struct Store{
    let loc : Location
    let name : String
    let deliveryRange = 2.0
    
    func isDeliverable(useLoc : Location) -> Bool{
        let distanceToStore = distance(current: useLoc, target: loc)
        return distanceToStore < deliveryRange
    }
}   //struct 안에 변수로 struct 넣기

let current = Location(x : 0, y : 0)
let store1 = Store(loc : Location(x : 2, y : 3), name : "gs")
let store2 = Store(loc : Location(x : 5, y : 6), name :"school")
let store3 = Store(loc : Location(x : 4, y : 4), name : "bus station")

let stores = [store1,store2,store3]     //struct 배열

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
    if let closerStore = minDistanceStore{  //optional string형
        print("close store : \(closerStore) isDeliverable : \(isDeliverable)")
    }
    else{
        print("there are no way")
    }
}
printCloserStore(currentLocation : current, stores: stores)
```

