import UIKit
import Foundation
import AVFoundation

class PlayerViewController : UIViewController{
    
    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var totalDuration: UILabel!
    @IBOutlet weak var timeSilder: UISlider!
    
    let simplePlayer = SimplePlayer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTrackInfo()
    }
    
    func updateTrackInfo(){
        guard let track = simplePlayer.currentItem()?.convertToTrack() else { return }
        trackImage.image = track.trackImage
        trackName.text = track.trackName
        artistName.text = track.artistName
    }
    
}
