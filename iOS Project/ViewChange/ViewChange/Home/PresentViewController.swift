import UIKit
import Foundation

class PresentViewController : UIViewController{
    var presentData : String?
    var delegate_present : MyDelegate?
    
    @IBOutlet weak var presentReceiveLabel: UILabel!
    @IBOutlet weak var presentInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentReceiveLabel.text = "\(presentData!)"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if presentInput.text != ""{
            delegate_present?.receiveDataByPresent(presentInput.text!)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
