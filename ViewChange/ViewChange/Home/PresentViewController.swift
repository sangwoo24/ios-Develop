import UIKit
import Foundation

class PresentViewController : UIViewController{
    
    @IBOutlet weak var presentReceiveLabel: UILabel!
    @IBOutlet weak var presentInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
