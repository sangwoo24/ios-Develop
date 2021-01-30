import UIKit
import UserNotifications

class AlarmViewController: UIViewController, GetAlarmData {
    
    @IBOutlet weak var addAlarmButton: UIButton!
    @IBOutlet weak var addNomalAlarm: UIButton!
    @IBOutlet weak var addQuickAlarm: UIButton!
    @IBOutlet weak var floatingStackView: UIStackView!
    @IBOutlet weak var alarmTable: UITableView!
    
    // model
    var quickAlarm: [QuickAlarm] = []
    var normalAlarm: [NormalAlarm] = []

    
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
        self.quickAlarm.append(quickAlarm)
        self.alarmTable.reloadData()
        print("--> time: \(quickAlarm.time)")
    }
    
    func getNormalAlarmData(normalAlarm: NormalAlarm) {
        self.normalAlarm.append(normalAlarm)
        self.alarmTable.reloadData()
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
            return 3
        } else {
            return self.quickAlarm.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "normalAlarmCell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "quickAlarmCell", for: indexPath)
        }
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


class AlarmCell: UITableViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var alarmOnOff: UISwitch!
    @IBOutlet weak var alarmDay: UILabel!
}


protocol GetAlarmData {
    func getQuickAlarmData(quickAlarm: QuickAlarm)
    func getNormalAlarmData(normalAlarm: NormalAlarm)
}
