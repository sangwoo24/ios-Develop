import UIKit

class BountyViewModel{
    let bountyInfoList : [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 44400000),
        BountyInfo(name: "luffy", bounty: 123123),
        BountyInfo(name: "nami", bounty: 123123123),
        BountyInfo(name: "robin", bounty: 124124214),
        BountyInfo(name: "sanji", bounty: 124124),
        BountyInfo(name: "zoro", bounty: 12412412424)
    ]
    
    var sortedList : [BountyInfo]{
        let sortedList = bountyInfoList.sorted{ prev, next in
            return prev.bounty > next.bounty
        }
        return sortedList
    }
    
    func numberOfBountyList() -> Int{
        return bountyInfoList.count
    }
    
    func bountyInfoOfIndex(index : Int) -> BountyInfo{
        return sortedList[index]
    }
    
}
