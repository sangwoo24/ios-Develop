import UIKit

class HomeViewController: UIViewController, Mydelegate{
    @IBOutlet weak var table: UITableView!
    var list : [Memo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }

    @IBAction func addMemo(_ sender: Any) {
        guard let memoVC = self.storyboard?.instantiateViewController(withIdentifier: "memo") as? MemoViewController else { return }
        memoVC.delegate = self
        self.navigationController?.pushViewController(memoVC, animated: true)
    }
    
    func appendMemo(memo : Memo){
        list.append(memo)
        table.reloadData()
    }
}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.memoTitle?.text = list[indexPath.row].title
        cell.memoContents?.text = list[indexPath.row].contents
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //delete
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //move
    }
}

protocol Mydelegate {
    func appendMemo(memo : Memo)
}
