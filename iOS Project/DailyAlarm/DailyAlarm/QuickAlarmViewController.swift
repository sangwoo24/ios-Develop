import UIKit

class QuickAlarmViewController: UIViewController {
    @IBOutlet weak var quickAlarmSettingView: UIView!
    @IBOutlet weak var quickAlarmTimeLabel: UILabel!
    
    var quickTime: Int = 0
    var delegate: GetAlarmData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addOneMinute(_ sender: Any) {
        self.quickTime += 1
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func addFiveMinute(_ sender: Any) {
        self.quickTime += 5
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func addTenMinute(_ sender: Any) {
        self.quickTime += 10
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func addFifteenMinute(_ sender: Any) {
        self.quickTime += 15
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func addThirtyMinute(_ sender: Any) {
        self.quickTime += 30
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func addOneHour(_ sender: Any) {
        self.quickTime += 60
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func clearQuickTime(_ sender: Any) {
        self.quickTime = 0
        setQuickTimeLabel(time: self.quickTime)
    }
    
    @IBAction func complete(_ sender: Any) {
        dismiss(animated: true) {
            let quickAlarm = self.intToQuickAlarm(time: self.quickTime)
            self.delegate?.getQuickAlarmData(quickAlarm: quickAlarm)
        }
    }
    
    func intToQuickAlarm(time: Int) -> QuickAlarm {
        return QuickAlarm(time: time)
    }
    
    
    func setQuickTimeLabel(time: Int) {
        let hour = time / 60
        let minute = time - ((time / 60) * 60)
        
        if hour == 0 {
            self.quickAlarmTimeLabel.text = "+ \(minute) 분"
        } else {
            self.quickAlarmTimeLabel.text = "+ \(hour) 시간 \(minute) 분"
        }
        
    }
    
    func setView() {
        self.view.backgroundColor = .clear
        self.quickAlarmSettingView.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: self.view.frame.height / 2)
        self.quickAlarmSettingView.layer.cornerRadius = 10
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap(_: )))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tap(_ gesture: UITapGestureRecognizer) {
        let dismissArea = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height / 2 + 40)
        let point = gesture.location(in: self.view)
        
        if dismissArea.contains(point) {
            dismiss(animated: true, completion: nil)
        }
    }
}
