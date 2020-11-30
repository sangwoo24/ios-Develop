import UIKit

class NextViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var text : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let text = text{
            label.text = text + "번째 Cell"
            self.navigationItem.title = "index : " + text
        }
    }
}
