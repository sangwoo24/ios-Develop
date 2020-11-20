import UIKit

class ViewController: UIViewController, MyDelegate, UINavigationControllerDelegate {
    var data : String = ""
    var navigation_data : String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var presentDataLabel: UILabel!
    @IBOutlet weak var navigationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            guard let dest = segue.destination as? SegueViewController else {
                return
            }
            dest.delegate = self
        }
    }
    
    @IBAction func showSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    //Present
    @IBAction func showPresent(_ sender: Any) {
        guard let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentViewController") as? PresentViewController else{ return }
        presentVC.modalPresentationStyle = .fullScreen
        presentVC.presentData = "hello PresentView"
        presentVC.delegate_present = self
        self.present(presentVC, animated: true, completion: nil)
    }

    //Navigation
    @IBAction func showNavigation(_ sender: Any) {
        guard let navigationVC = self.storyboard?.instantiateViewController(identifier: "NavigationViewController") as? NavigationViewController else { return }
        navigationVC.navitationData = "hello NavigationView"
        navigationVC.delegate_navigation = self
        self.navigationController?.pushViewController(navigationVC, animated: true)
    }
}

protocol MyDelegate {
    func receiveData(_ data : String)
    func receiveDataByPresent(_ data : String)
    func receiveDataFromNavigation(_ data : String)
}

extension ViewController{
    //Protocol
    func receiveData(_ data: String) {
        self.data = data
        label.text = "String : \(data)"
    }
    
    func receiveDataByPresent(_ data: String) {
        presentDataLabel.text = "String : \(data)"
    }
    
    func receiveDataFromNavigation(_ data: String) {
        navigationLabel.text = "String : \(data)"
    }
}
