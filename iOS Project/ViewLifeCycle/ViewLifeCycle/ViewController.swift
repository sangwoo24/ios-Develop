import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Home: ViewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Home: ViewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Home: ViewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Home: ViewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Home: ViewDidDisappear")
    }
    
    @IBAction func goToSegueView(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    @IBAction func goToPresentView(_ sender: Any) {
        guard let presentVC = storyboard?.instantiateViewController(identifier: "PresentView") as? SecondPresentViewController else { return }
        present(presentVC, animated: true, completion: nil)
    }
    
    @IBAction func goToNavigationView(_ sender: Any) {
        guard let navigationVC = storyboard?.instantiateViewController(identifier: "NavigationView") as? SecondNavigationViewController else { return }
        self.navigationController?.pushViewController(navigationVC, animated: true)
    }
}

