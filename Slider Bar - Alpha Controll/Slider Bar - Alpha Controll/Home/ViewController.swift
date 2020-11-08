import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var Label: UILabel!
    let maxMultiple = 2
    var labelSize : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSize = Label.font.pointSize
        Label.alpha = 0.5
    }
    
    @IBAction func sizeControll(_ sender: UISlider) {
        let value = CGFloat(sizeSlider.value)
        var size = labelSize * value * CGFloat(maxMultiple)
        size = size.rounded(.up)
        Label.font = Label.font.withSize(size)

    }
    @IBAction func alphaControll(_ sender: UISlider) {
        let value = CGFloat(alphaSlider.value)
        Label.alpha = value
    }
}

