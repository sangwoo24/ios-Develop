import UIKit
import UserNotifications

class AlarmViewController: UIViewController, GetAlarmData {
    
    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var addNomalAlarm: UIButton!
    @IBOutlet weak var addQuickAlarm: UIButton!
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var alarmTable: UITableView!
    
    // model
    var quickAlarms: [QuickAlarm] = []
    var normalAlarms: [NormalAlarm] = []

    
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
    
    @IBAction func addQuickAlarmButton(_ sender: Any) {
        guard let quickVC = storyboard?.instantiateViewController(identifier: "quickAlarm") as? QuickAlarmViewController else { return }
        quickVC.delegate = self
        present(quickVC, animated: true, completion: nil)
    }
    
    @IBAction func addNormalAlarmButton(_ sender: Any) {
        guard let normalVC = storyboard?.instantiateViewController(identifier: "normalAlarm") as? NormalAlarmViewController else { return }
        normalVC.completionClosure = { normalAlarm in
            self.normalAlarms.append(normalAlarm)
            self.alarmTable.reloadData()
            print(self.normalAlarms)
        }
        present(normalVC, animated: true, completion: nil)
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
            appearButtons(buttons: self.buttons)
            appearBackgroundDimView(view: self.floatingDimView)
        } else {
            disappearButtons(buttons: buttons)
            disappearBackgroundDimView(view: self.floatingDimView)
        }
        selectAndRotationButton(button: self.addAlarmButton, isSelected: self.addAlarmButton.isSelected)
    }
    
    func getQuickAlarmData(quickAlarm: QuickAlarm) {
        self.quickAlarms.append(quickAlarm)
        self.alarmTable.reloadData()
        print("--> time: \(quickAlarm.time)")
    }

    func disappearBackgroundDimView(view: UIView) {
        UIView.animate(withDuration: 0.5, animations: {
            self.floatingDimView.alpha = 0
        }){ _ in self.floatingDimView.isHidden = true }
    }
    
    func disappearButtons(buttons: [UIButton]) {
        buttons.reversed().forEach { button in
            UIView.animate(withDuration: 0.3) {
                button.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func appearBackgroundDimView(view: UIView) {
        view.isHidden = false
        UIView.animate(withDuration: 0.5) {
            view.alpha = 1
        }
    }
    
    func appearButtons(buttons: [UIButton]) {
        buttons.forEach { button in
            button.isHidden = false
            button.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                button.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func selectAndRotationButton(button: UIButton, isSelected: Bool) {
        let rotation = button.isSelected ? CGAffineTransform(rotationAngle: .pi - (.pi / 4)) : CGAffineTransform.identity
        
        UIView.animate(withDuration: 0.5) {
            let bgColor = isSelected ? UIColor.white : UIColor.black
            let tintColor = isSelected ? UIColor.black : UIColor.white
            button.backgroundColor = bgColor
            button.tintColor = tintColor
            button.transform = rotation
        }
    }
}


extension AlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.normalAlarms.count
        } else {
            return self.quickAlarms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "normalAlarmCell", for: indexPath) as? NormalAlarmCell else { return UITableViewCell() }
            let normalAlarm = self.normalAlarms[indexPath.row]
            cell.updateCell(normalAlarm: normalAlarm)
            
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "quickAlarmCell", for: indexPath) as? QuickAlarmCell else { return UITableViewCell() }
            let quickAlarm = self.quickAlarms[indexPath.row]
            cell.updateCell(quickAlarm: quickAlarm)
            
            return cell
        }
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Normal Alarm"
        } else {
            return "Quick Alarm"
        }
    }
}


class NormalAlarmCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var alarmDay: UILabel!
    private let week = ["일","월","화","수","목","금","토"]
    
    func updateCell(normalAlarm: NormalAlarm) {
        self.timeLabel.text = normalAlarm.time
        self.label.text = normalAlarm.label
        self.alarmDay.text = getAlarmDay(day: normalAlarm.day)
    }
    
    @IBAction func alarmOnOffSwitch(_ sender: UISwitch) {
        print("--> isOn?: \(sender.isOn)")
    }
    
    func getAlarmDay(day: [Int]) -> String {
        let totalCount = day.filter { $0 == 1 }.count
        
        if totalCount == day.count {
            return "매일"
        } else {
            var alarmDays = ""
            for i in 0..<day.count {
                if day[i] == 1 {
                    alarmDays += self.week[i]
                }
            }
            return alarmDays
        }
    }
}

class QuickAlarmCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    func updateCell(quickAlarm: QuickAlarm) {
        self.timeLabel.text = intToTime(time: quickAlarm.time)
    }
    
    @IBAction func alarmOnOffSwitch(_ sender: UISwitch) {
        print("--> isOn?: \(sender.isOn)")
    }
    
    func intToTime(time: Int) -> String {
        let hour = time / 60
        let minute = time - ((time / 60) * 60)
        
        if hour == 0 {
            return "+ \(minute) 분"
        } else {
            return "+ \(hour) 시간 \(minute) 분"
        }
    }
}

protocol GetAlarmData {
    func getQuickAlarmData(quickAlarm: QuickAlarm)
}
