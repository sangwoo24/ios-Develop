import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    @IBOutlet weak var contentsInput: UITextView!
    var delegate : Mydelegate?
    var cellMemo : Memo?
    var index : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        contentsInput.layer.borderWidth = 1.0
        contentsInput.layer.borderColor = UIColor.black.cgColor
        
        if let cellMemo = cellMemo{
            titleInput.text = cellMemo.title
            contentsInput.text = cellMemo.contents
        }
    }
    
    @IBAction func complete(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func inputMemo(){
        let title = titleInput.text!
        let contents = contentsInput.text!
        let memo = Memo(title,contents)
        
        if title != ""{
            if let index = index{
                delegate?.insertMemo(index: index, memo: memo)
            } else{
                delegate?.appendMemo(memo: memo)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        inputMemo()
    }
}
