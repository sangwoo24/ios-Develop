import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var memoTitle : UILabel?
    @IBOutlet weak var memoContents : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
