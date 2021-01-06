import UIKit

class TableViewCell3: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textLabel?.text = "여기는 3번째 Cell[Custom Button Class]"
    }

    @IBAction func customButtonOnClick(_ sender: Any) {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

