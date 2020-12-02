import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var memoTitle : UILabel?
    @IBOutlet weak var memoContents : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.layer.borderWidth = 1
//        self.layer.cornerRadius = 10
//        self.layer.borderColor = UIColor.black.cgColor
//        self.contentView.layoutMargins.bottom = 50.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
