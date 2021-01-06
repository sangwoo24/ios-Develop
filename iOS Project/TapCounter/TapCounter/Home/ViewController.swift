import UIKit

class ViewController: UIViewController {
    var cnt : Int = 0
    var timer : Timer?
    
    @IBOutlet weak var cntText: UILabel!
    @IBOutlet weak var holdButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cntText.text = "-"
        
        // hold
        let press = UILongPressGestureRecognizer()
        press.addTarget(self, action: #selector(self.pressed(_:)))
        holdButton.addGestureRecognizer(press)
    }
    
    @IBAction func hold(_ sender: UIButton) {
        holdButton.isHighlighted = true
        cnt += 1
        labelSetText(Label: cntText, text: "\(cnt)")
    }
    
    @IBAction func tap(_ sender: Any) {
        cnt += 1
        labelSetText(Label: cntText, text: "\(cnt)")
    }
    
    @IBAction func reset(_ sender: Any) {
        cnt = 0
        labelSetText(Label: cntText, text: "\(cnt)")
    }
}
extension ViewController{
    func labelSetText(Label : UILabel, text : String){
        Label.text = text
    }
    
    @objc func pressed(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else { return }
        
        switch ges.state{
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(hold(_:)), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate() //timer stop
            holdButton.isHighlighted = false
        default:
            break
        }
    }
}

