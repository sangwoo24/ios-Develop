import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(start), userInfo: nil, repeats: false)
    }
    
    @objc func start(){
        performSegue(withIdentifier: "segue", sender: nil)
    }
}

