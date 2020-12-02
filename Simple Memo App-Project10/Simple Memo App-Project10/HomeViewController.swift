import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    let memoManager = MemoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    @IBAction func test(_ sender: Any) {
        table.reloadData()
    }
    @IBAction func addMemo(_ sender: Any) {
        guard let memoVC = self.storyboard?.instantiateViewController(withIdentifier: "memo") as? MemoViewController else { return }
        self.navigationController?.pushViewController(memoVC, animated: true)
    }
    
    func appendMemo(memo : Memo){
        memoManager.addMemo(memo)
        memoManager.printMemo()
    }
}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoManager.numOfMemoList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.memoTitle?.text = memoManager.memoList[indexPath.row].title
        cell.memoContents?.text = memoManager.memoList[indexPath.row].contents
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
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
