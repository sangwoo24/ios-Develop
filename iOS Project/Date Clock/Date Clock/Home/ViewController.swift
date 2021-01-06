import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentTimeText: UILabel!
    var timer : Timer?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.clock), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.clock), userInfo: nil, repeats: true)
    }

    @objc func clock(){
        currentTimeText.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
    }
    
}

