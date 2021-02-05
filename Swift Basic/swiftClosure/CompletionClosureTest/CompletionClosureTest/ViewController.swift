import UIKit

class ViewController: UIViewController {

    var sequence: [Int] = []

    @IBAction func goToSecondView(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "second") as? SecondViewController else { return }
        present(vc, animated: true, completion: nil)
        
        vc.handler = { str in
            print("start completion")
            print("--> 받아온 Data: \(str)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

