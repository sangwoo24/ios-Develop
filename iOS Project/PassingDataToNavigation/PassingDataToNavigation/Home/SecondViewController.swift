import UIKit

class SecondViewController: UIViewController {
    var str : String?
    
    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "second"
        self.navigationController?.navigationBar.barTintColor = .systemIndigo
        
        secondLabel.numberOfLines = 0
        if let str = str{
            secondLabel.text = str
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        guard let mainVC = self.navigationController?.viewControllers[0] as? FirstViewController else { return }
        mainVC.updateNavigationBar()
    }
}
