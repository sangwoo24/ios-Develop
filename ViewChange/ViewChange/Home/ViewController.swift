import UIKit

class ViewController: UIViewController, MyDelegate {
    
    //Segue
    var data : String = ""
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segueInput: UITextField!

    //Present
    @IBOutlet weak var presentDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
            guard let dest = segue.destination as? SegueViewController else {
                return
            }
            dest.delegate = self
        }
    }
    
    
    //Segue
    @IBAction func showSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    
    //Present
    @IBAction func showPresent(_ sender: Any) {
        let presentVC = self.storyboard?.instantiateViewController(withIdentifier: "PresentViewController")
        presentVC?.modalTransitionStyle = .coverVertical
        //data 넘겨
        self.present(presentVC!, animated: true, completion: nil)
    }
    
    func receiveData(_ data: String) {
        self.data = data
        label.text = "String : \(data)"
    }
}

protocol MyDelegate {
    func receiveData(_ data : String)
}
