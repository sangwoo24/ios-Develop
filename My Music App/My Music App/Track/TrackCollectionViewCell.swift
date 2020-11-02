import UIKit

class TrackCollectionViewCell : UICollectionViewCell{
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    
    
    func updateUI(_ item : Track?){
        guard let track = item else { return }
        trackName.text = track.trackName
        artistName.text = track.artistName
        trackImage.image = track.trackImage
    }
}
