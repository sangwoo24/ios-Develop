import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var tableViewData : [String] = ["apple","banana","candy","dev"]
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add(_ sender: Any) {
        if input.text != ""{
            tableViewData.append(input.text!)
            input.text = ""
            table.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Array(Set(tableViewData.map{ $0.first! })).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(Array(Set(tableViewData.map{$0.first!})).sorted()[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? tableViewCell else { return UITableViewCell() }
        let charactor = Array(Set(tableViewData.map{$0.first!})).sorted()[indexPath.section]
        cell.label?.text = tableViewData.filter{ $0.first! == charactor }[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let charactor = Array(Set(tableViewData.map{ $0.first! })).sorted()[section]
        return tableViewData.filter{ $0.first! == charactor }.count
    }
}





