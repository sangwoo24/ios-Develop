import UIKit
import Foundation

class FirstViewController: UIViewController {

    @IBOutlet weak var inputText: UITextView?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBar()
        // Button
        let bt = UIBarButtonItem.init(title: "Done", style : .plain, target : self, action : #selector(printNum))
        navigationItem.rightBarButtonItem = bt
    }
    
    
    func updateNavigationBar(){
        // Navigation Bar - Title
        navigationController?.navigationBar.topItem?.title = "First"
        
        // Tint Color
        navigationController?.navigationBar.barTintColor = .systemGreen
    
        // Title Color
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        // BarText Color
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    @objc func printNum(){
        guard let secondView = self.storyboard?.instantiateViewController(identifier : "secondView") as? SecondViewController else{ return }
        guard let text = inputText?.text else{ return }
        if text != ""{
            secondView.str = text
        }
        
        // BackButton
        let backButton = UIBarButtonItem()
        backButton.title = "back"
        navigationItem.backBarButtonItem = backButton
        
        // Push
        self.navigationController?.pushViewController(secondView, animated : true)
    }
}



