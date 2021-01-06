import UIKit

class Track{
    let trackName : String
    let artistName : String
    let trackImage : UIImage
    
    init(trackName : String, artistName : String, trackImage : UIImage) {
        self.trackName = trackName
        self.artistName = artistName
        self.trackImage = trackImage
    }
}
