import UIKit
import AVFoundation

class NormalAlarmViewController: UIViewController {
    @IBOutlet weak var editLabelText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var soundList: [String] = []
    private let soundDirectory = "/System/Library/Audio/UISounds/New"
    private var day: [Int] = Array(repeating: 0, count: 7)
    private var soundURL: URL?
    
    var delegate: GetAlarmData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSystemSound()
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
    
    func getSystemSound() {
        if let list = FileManager.default.enumerator(atPath: soundDirectory)?.map({ String(describing: $0) }) {
            self.soundList = list
        }
    }
    
    func soundNameToURL(soundName: String) -> URL {
        let fullyQualifiedName = self.soundDirectory + "/" + soundName
        let url = URL(fileURLWithPath: fullyQualifiedName)
        
        return url
    }
}

extension NormalAlarmViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.soundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(soundList[indexPath.row])"
        if indexPath.row == 0 {
            self.soundURL = soundNameToURL(soundName: soundList[indexPath.row])
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let section = indexPath.section
        let numberOfRows = tableView.numberOfRows(inSection: section)
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        for row in 0..<numberOfRows {
            if row == indexPath.row {
                cell.accessoryType = .checkmark
            } else {
                let otherIndexPath = IndexPath(row: row, section: section)
                if let otherCell = tableView.cellForRow(at: otherIndexPath) {
                    otherCell.accessoryType = .none
                }
            }
        }
        
        let url = soundNameToURL(soundName: soundList[indexPath.row])
        self.soundURL = url
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        AudioServicesPlaySystemSoundWithCompletion(soundId, {
            AudioServicesDisposeSystemSoundID(soundId)
        })
    }
}



