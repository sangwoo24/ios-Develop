import UIKit

class CustomTabBarController : UITabBarController, UITabBarControllerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tab selected")
    }
}

