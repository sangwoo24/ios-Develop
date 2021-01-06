import UIKit

class TrackCollecionViewCell: UICollectionViewCell {
    @IBOutlet weak var trackThumbnail: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var trackArtist: UILabel!
    
    //collectionView 가 실제 호출될 때, 호출이 됨. (그림에서 깨어날 때)
    override func awakeFromNib() {
        super.awakeFromNib()
        trackThumbnail.layer.cornerRadius = 4
        trackArtist.textColor = UIColor.systemGray2
    }
    
    func updateUI(item: Track?) {
        // TODO: 곡정보 표시하기
        guard let track = item else{ return }
        trackThumbnail.image = track.artwork
        trackTitle.text = track.title
        trackArtist.text = track.artist
    }
}
