import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var contentsInput: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        contentsInput.layer.borderWidth = 1.0
        contentsInput.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func complete(_ sender: Any) {
        let title = titleInput.text ?? "제목없음"
        let contents = contentsInput.text ?? ""

        let memo = Memo(title,contents)
        guard let mainVC = self.storyboard?.instantiateViewController(identifier: "home") as? HomeViewController else { return }
        mainVC.appendMemo(memo: memo)
        self.navigationController?.popViewController(animated: true)
    }
}
