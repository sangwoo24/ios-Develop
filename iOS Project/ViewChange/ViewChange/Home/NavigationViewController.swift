import Foundation
import UIKit

class NavigationViewController : UIViewController{
    var navitationData : String?
    var delegate_navigation : MyDelegate?
    
    @IBOutlet weak var navigationReceiveLabel: UILabel!
    @IBOutlet weak var navigationInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationReceiveLabel.text = navitationData
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        guard let mainVC = self.navigationController?.viewControllers[0] as? ViewController else { return }
        if navigationInput.text != ""{
            mainVC.receiveDataFromNavigation(navigationInput.text!)
        }
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
