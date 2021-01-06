import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var up: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var Label: UILabel!

    var x : CGFloat = 0.0
    var y : CGFloat = 0.0
    let maxMultiple = 2
    let transformValue : CGFloat = 10.0
    var labelSize : CGFloat = 0.0
    var timer : Timer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x = Label.frame.origin.x
        y = Label.frame.origin.y
        labelSize = Label.font.pointSize
        Label.alpha = 0.5
        
        up.addGestureRecognizer(setGestureRecognizer(0))
        down.addGestureRecognizer(setGestureRecognizer(1))
        right.addGestureRecognizer(setGestureRecognizer(2))
        left.addGestureRecognizer(setGestureRecognizer(3))
    }
    
    func setGestureRecognizer(_ value : Int) -> UILongPressGestureRecognizer{
        let press = UILongPressGestureRecognizer()
        switch value {
        case 0:
            press.addTarget(self, action: #selector(self.pressedUp(_:)))
        case 1:
            press.addTarget(self, action: #selector(self.pressedDown(_:)))
        case 2:
            press.addTarget(self, action: #selector(self.pressedRight(_:)))
        case 3:
            press.addTarget(self, action: #selector(self.pressedLeft(_:)))
        default:
            break
        }
        
        
        return press
    }
}

extension ViewController{
    
    @IBAction func sizeControll(_ sender: UISlider) {
        let value = CGFloat(sizeSlider.value)
        let size = labelSize * value * CGFloat(maxMultiple).rounded(.up)
        Label.font = Label.font.withSize(size)
    }
    
    @IBAction func alphaControll(_ sender: UISlider) {
        let value = CGFloat(alphaSlider.value)
        Label.alpha = value
    }
    
    @IBAction func up(_ sender: UIButton) {
        if(!pointError(x, y-transformValue)){
            Label.frame.origin.y -= transformValue
            y = Label.frame.origin.y
        }
    }
  
    @IBAction func down(_ sender: UIButton) {
        if(!pointError(x, y+transformValue)){
            Label.frame.origin.y += transformValue
            y = Label.frame.origin.y
        }
    }
    
    @IBAction func left(_ sender: UIButton) {
        if(!pointError(x-transformValue, y)){
            Label.frame.origin.x -= transformValue
            x = Label.frame.origin.x
        }

    }
    
    @IBAction func right(_ sender: UIButton) {
        if(!pointError(x+transformValue, y)){
            Label.frame.origin.x += transformValue
            x = Label.frame.origin.x
        }
    }
    
    func pointError(_ x : CGFloat, _ y : CGFloat) -> Bool {
        let width = Label.frame.width
        let height = Label.frame.height
        
        if(x < 0 || x + width > view.bounds.width || y < 30 || y + height > view.bounds.height){
            return true
        }else{
            return false
        }
    }
    
    @objc func pressedUp(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else {return}

        switch ges.state {
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(up(_:)), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate()
        default:
            break
        }
    }
    
    @objc func pressedDown(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else {return}
        
        switch ges.state {
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(down(_:)), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate()
        default:
            break
        }
    }
    
    @objc func pressedRight(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else {return}
        
        switch ges.state {
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(right(_:)), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate()
        default:
            break
        }
    }
    
    @objc func pressedLeft(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else {return}
        
        switch ges.state {
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(left(_:)), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate()
        default:
            break
        }
    }
}

