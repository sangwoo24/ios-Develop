import Foundation
import UIKit

class SegueViewController : UIViewController{
    
    var delegate : MyDelegate?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if input.text != ""{
            delegate?.receiveData(input.text!)
        }
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
