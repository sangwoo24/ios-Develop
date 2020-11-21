import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var tableViewData : [String] = []
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func add(_ sender: Any) {
        if input.text != ""{
            tableViewData.append(input.text!)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? tableViewCell else { return UITableViewCell() }
        cell.label?.text = tableViewData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewData.count
    }
}





