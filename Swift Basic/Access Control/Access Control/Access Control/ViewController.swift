import UIKit
import SangwooFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let openClassInstance = OpenClass()
        let publicClassInstance = PublicClass()
    }
}

class OpenSubClass: OpenClass {}
//class PublicSubClass: PublicClass {} --> 오류



