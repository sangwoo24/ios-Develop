import UIKit

struct BountyInfo{
    var name : String
    var bounty : Int
    
    init(name : String, bounty : Int) {
        self.name = name
        self.bounty = bounty
    }

    func getImageInfo() -> UIImage?{
        return UIImage(named: "\(self.name).jpg")
    }
}
