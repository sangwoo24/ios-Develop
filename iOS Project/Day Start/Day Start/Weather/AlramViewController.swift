import UIKit

class AlramViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var addAlramButton: UIButton!
    var alram: Alram?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addAlram(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        let date = dateFormatter.string(from: self.timePicker.date)
        self.alram?.setAlram(time: date)
    }
}
