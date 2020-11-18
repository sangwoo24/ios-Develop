import Foundation
import UIKit

class NavigationViewController : UIViewController{
    var d : UINavigationControllerDelegate?
    var navitationData : String?
    var delegate_navigation : MyDelegate?
    
    @IBOutlet weak var navigationReceiveLabel: UILabel!
    @IBOutlet weak var navigationInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationReceiveLabel.text = navitationData
    }
    @IBAction func back(_ sender: Any) {
        guard let mainVC = self.navigationController?.viewControllers[0] as? ViewController else { return }
        mainVC.navigation_data = "i'm navigationView"
        mainVC.sangwoo()
        self.navigationController?.popViewController(animated: true)
    }
}
