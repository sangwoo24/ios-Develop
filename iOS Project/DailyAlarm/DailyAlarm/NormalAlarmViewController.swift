import UIKit

class NormalAlarmViewController: UIViewController {
    @IBOutlet weak var editLabelText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var day: [Int] = Array(repeating: 0, count: 7)
    var delegate: GetAlarmData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func weekButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.setTitleColor(.red, for: .selected)
            sender.tintColor = .clear
            self.day[sender.tag] = 1
        } else {
            sender.setTitleColor(.white, for: .normal)
            self.day[sender.tag] = 0
        }
    }
    
    @IBAction func completion(_ sender: Any) {
        let time = getTime()
        let day = self.day
        let labelText = getLabelText()
        let isOn = false
    }
    
    func getLabelText() -> String {
        if let text = self.editLabelText.text {
            return text
        } else {
            return ""
        }
    }
    
    func getTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        let date = dateFormatter.string(from: self.datePicker.date)
        return date
    }
}

extension NormalAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sound", for: indexPath)
        return cell
    }
}



