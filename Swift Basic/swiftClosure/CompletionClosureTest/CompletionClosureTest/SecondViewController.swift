import UIKit

class SecondViewController: UIViewController {

    var handler: ((String) -> (Void))?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToFirstView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        handler?("안녕하세요")
        // dismiss 아래에 closure? - view 의 dismiss 는 비 동기적 처리가 되는듯.
    }
}

