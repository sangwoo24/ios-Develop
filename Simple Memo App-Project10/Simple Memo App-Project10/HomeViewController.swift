import UIKit

class HomeViewController: UIViewController, Mydelegate{
    @IBOutlet weak var table: UITableView!
    var memoList : [Memo] = []
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        setGesture()
    }


    @IBAction func addMemo(_ sender: Any) {
        guard let memoVC = self.storyboard?.instantiateViewController(withIdentifier: "memo") as? MemoViewController else { return }
        memoVC.delegate = self
        self.navigationController?.pushViewController(memoVC, animated: true)
    }
    
    func appendMemo(memo : Memo){
        memoList.append(memo)
        reloadData()
    }
    
    func insertMemo(index : Int, memo: Memo) {
        memoList[index] = memo
        reloadData()
    }
    
    func reloadData(){
        self.table.reloadData()
    }
    
    func setGesture(){
        let press = UILongPressGestureRecognizer()
        press.addTarget(self, action: #selector(self.pressed(_:)))
        table.addGestureRecognizer(press)
    }
    
    @objc func pressed(_ gesture : UILongPressGestureRecognizer?){
        guard let ges = gesture else { return }
        
        switch ges.state {
        case .began:
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(setEditMode), userInfo: nil, repeats: true)
        case .ended, .cancelled:
            timer?.invalidate()
        default:
            break
        }
    }
    
    @objc func setEditMode(){
        table.setEditing(true, animated: true)
    }
    @IBAction func editDone(_ sender: Any) {
        table.setEditing(false, animated: true)
    }
}


extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    //tableView setting
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.memoTitle?.text = memoList[indexPath.row].title
        cell.memoContents?.text = memoList[indexPath.row].contents
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //delete
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            memoList.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: .right)
        }
    }
    
    //move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let memo = memoList.remove(at: sourceIndexPath.row)
        memoList.insert(memo, at: destinationIndexPath.row)
    }
    
    //cell Click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let memoVC = self.storyboard?.instantiateViewController(withIdentifier: "memo") as? MemoViewController else { return }
        memoVC.delegate = self
        memoVC.cellMemo = memoList[indexPath.row]
        memoVC.index = indexPath.row
        self.navigationController?.pushViewController(memoVC, animated: true)
    }
}

protocol Mydelegate {
    func appendMemo(memo : Memo)
    func insertMemo(index : Int, memo : Memo)
}
