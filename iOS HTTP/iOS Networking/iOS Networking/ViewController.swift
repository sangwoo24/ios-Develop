import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // shared 사용
        let session = NetworkHandler.shared
        session.getData(person: "지드래곤")
        
        // delegate 사용
//        let networking = NetworkHandlerToDelegate()
//        networking.getData(person: "지드래곤")
    }
}

