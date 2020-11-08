import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var Label: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        Label.alpha = 0.5
    }
    
    @IBAction func alphaControll(_ sender: UISlider) {
        let value = CGFloat(alphaSlider.value)
        Label.alpha = value
        
    }
}

