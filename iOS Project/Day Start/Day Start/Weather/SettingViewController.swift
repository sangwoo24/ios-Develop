import UIKit

class SettingViewController: UIViewController, Alram {
    @IBOutlet weak var settingTableView: UITableView!
    private let settingCellText = ["날씨 알리미 설정","version","개발자"]
    private let reuseCellName = ["alarmCell", "versionCell", "nameCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setAlram(time: String) {
        let indexPath = IndexPath(row: 0, section: 0)
        if let cell = self.settingTableView.cellForRow(at: indexPath) {
            cell.detailTextLabel?.text = time
            self.settingTableView.reloadData()
        }
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCellName[indexPath.row], for: indexPath)
        cell.textLabel?.text = settingCellText[indexPath.row]
        if indexPath.row == 1 {
            cell.detailTextLabel?.text = "1.0"
        } else if indexPath.row == 2 {
            cell.detailTextLabel?.text = "석상우"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "설정사항"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(identifier: "Alram") as? AlramViewController else { return }
            vc.alram = self
            present(vc, animated: true, completion: nil)
        }
    }
    
    
}

protocol Alram {
    func setAlram(time: String)
}
