import UIKit

class ViewController: UIViewController {

    @IBOutlet var table : UITableView!
    @IBOutlet var myNavigationItem : UINavigationItem!
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //delegate, datasource
        table.delegate = self
        table.dataSource = self
        
        //nib
        let cell2 = UINib(nibName: "TableViewCell2", bundle: nil)
        let cell3 = UINib(nibName: "TableViewCell3", bundle: nil)
        table.register(cell2, forCellReuseIdentifier: "cell2")
        table.register(cell3, forCellReuseIdentifier: "cell3")
        
        //refreshControl
        if #available(iOS 10.0, *){
            table.refreshControl = refreshControl
        } else {
            table.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }
    
    @objc func check(_ Sender : UISwitch){
        Sender.isOn ? print("Y") : print("N")
        print(Sender.tag)
    }
    
    @objc func refresh(_ sender : Any?){
        print("refresh!!!")
        refreshControl.endRefreshing()
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // push, segue, present
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "nextViewController") as? NextViewController else{ return }
        nextVC.text = "\(indexPath.row + 1)"
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= 0 && indexPath.row <= 1{
            // 첫번째 Cell - Custom Button Code로 작성
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else{ return UITableViewCell() }
        
            let bt = UIButton()
            bt.backgroundColor = UIColor.blue
            bt.layer.cornerRadius = 5.0
            bt.setTitle("^-^", for: .normal)
            bt.sizeToFit()
            cell.accessoryView = bt
            
            return cell
        } else if indexPath.row >= 2 && indexPath.row <= 3{
            // 두번째 Cell - Disclosure Indicator + Right Detail Text
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? TableViewCell2 else{ return UITableViewCell() }
            return cell
        } else{
            // 세번째 Cell - Custom Button Class로 작성
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as? TableViewCell3 else{ return UITableViewCell() }
            return cell
        }
    }
}
