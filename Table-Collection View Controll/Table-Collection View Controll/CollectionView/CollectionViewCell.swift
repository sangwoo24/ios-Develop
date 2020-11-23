import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image : UIImageView?
    @IBOutlet weak var name : UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
