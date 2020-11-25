import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table : UITableView!
    @IBOutlet var button : CustomButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else{ return UITableViewCell() }
        
        if indexPath.row > 4{
            return cell
        }
        // Toggle Switch
        let sw = UISwitch()
        sw.isOn = false
        sw.tag = indexPath.row
        sw.addTarget(self, action: #selector(check(_:)), for: .valueChanged)
        cell.accessoryView = sw
        
        return cell
    }
    
    @objc func check(_ Sender : UISwitch){
        Sender.isOn ? print("Y") : print("N")
        print(Sender.tag)
    }
}

class CustomButton : UIButton{

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor(red: 255/255, green: 132/255, blue: 102/255, alpha: 1)
        self.tintColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
