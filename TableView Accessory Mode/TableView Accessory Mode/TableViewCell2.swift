import UIKit

class TableViewCell2: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textLabel?.text = "여기는 2번째 Cell[Right Detail]"
        self.detailTextLabel?.text = "next"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
