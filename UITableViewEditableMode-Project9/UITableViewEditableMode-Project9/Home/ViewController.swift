import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!    
    var arr : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        for i in (0...10){
            arr.append("\(i)")
        }
    }
    
    @IBAction func add(_ sender: Any) {
        self.table.setEditing(true, animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        self.table.setEditing(false, animated: true)
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate{
    
    //----------------------------------기본 UITableView 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = arr[indexPath.row]
        cell.detailTextLabel?.text = ""
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
    //---------------------------UITableView Delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //UITableView의 Editing Mode 설정
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            arr.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    /* 오른쪽 Delete Button 옆 추가 버튼 생성 [UIContextualAction]
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let share = UIContextualAction(style: .normal, title: "share"){action, view, completion in
            //share 선택 시 구현할 Code
            completion(true)}
        
        let delete = UIContextualAction(style: .destructive, title: "delete"){action, view, completion in completion(true)}
        
        return UISwipeActionsConfiguration(actions: [delete,share])
    }*/
    
    
    //---------------------------UITableView Move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let str = arr.remove(at: sourceIndexPath.row)
        arr.insert(str, at: destinationIndexPath.row)
    }
}
  
