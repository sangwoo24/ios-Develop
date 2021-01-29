import UIKit
import UserNotifications

class AlarmViewController: UIViewController {
    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var addNomalAlarm: UIButton!
    @IBOutlet weak var addQuickAlarm: UIButton!
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var alarmTable: UITableView!
    
    lazy var buttons: [UIButton] = [self.addNomalAlarm, self.addQuickAlarm]
    lazy var floatingDimView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.alpha = 0
        view.isHidden = true
        self.view.insertSubview(view, belowSubview: self.floatingStackView)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFloatingButtons()
    }
    
    func setFloatingButtons() {
        addAlarmButton.backgroundColor = .black
        addAlarmButton.tintColor = .white
        addAlarmButton.layer.cornerRadius = addAlarmButton.layer.bounds.width / 2
        addNomalAlarm.layer.cornerRadius = addNomalAlarm.layer.bounds.width / 2
        addQuickAlarm.layer.cornerRadius = addQuickAlarm.layer.bounds.width / 2
    }
    
    @IBAction func addAlarm(_ sender: UIButton) {
        self.addAlarmButton.isSelected = !self.addAlarmButton.isSelected
        
        if addAlarmButton.isSelected {
            buttons.forEach { button in
                button.isHidden = false
                button.alpha = 0
                
                UIView.animate(withDuration: 0.3) {
                    button.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
            self.floatingDimView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.floatingDimView.alpha = 1
            }
        } else {
            buttons.reversed().forEach { button in
                UIView.animate(withDuration: 0.3) {
                    button.isHidden = true
                    self.view.layoutIfNeeded()
                }
            }
            
            // 1번
            //UIView.animate(withDuration: 2) {
            //    self.floatingDimView.alpha = 0
            //}
            //self.floatingDimView.isHidden = true
            
            // 2번
            UIView.animate(withDuration: 0.5, animations: {
                self.floatingDimView.alpha = 0
            }){ _ in self.floatingDimView.isHidden = true }
        }
        
        // rotation
        let rotation = self.addAlarmButton.isSelected ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.5) {
            let bgColor = self.addAlarmButton.isSelected ? UIColor.white : UIColor.black
            let tintColor = self.addAlarmButton.isSelected ? UIColor.black : UIColor.white
            sender.backgroundColor = bgColor
            sender.tintColor = tintColor
            sender.transform = rotation
        }
    }
}


extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // deleteRows
        }
    }
}


class AlarmCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var alarmOnOff: UISwitch!
    @IBOutlet weak var alarmDay: UILabel!
}
