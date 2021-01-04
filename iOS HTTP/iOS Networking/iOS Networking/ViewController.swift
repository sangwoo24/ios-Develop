import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = NetworkHandler.shared
        
        guard let url = session.makeURL(person: "지드래곤") else { return }
        session.getData(person: "지드래곤")
    }
}

