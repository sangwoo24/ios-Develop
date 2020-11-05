import AVFoundation
import UIKit

//그냥 AVPlayerItem 확장하기 위해 extension 사용
extension AVPlayerItem {
    func convertToTrack() -> Track? {
        let metadatList = asset.metadata
        
        var trackTitle: String?
        var trackArtist: String?
        var trackArtwork: UIImage?
        
        for metadata in metadatList {
            if let title = metadata.title {
                trackTitle = title
            }
            
            if let artist = metadata.artist {
               trackArtist = artist
            }

            if let artwork = metadata.artwork {
                trackArtwork = artwork
            }
        }
        
        guard let title = trackTitle,
            let artist = trackArtist,
            let artwork = trackArtwork else {
                return nil
        }
        return Track(trackName: title, artistName: artist, trackImage: artwork)
    }
}
 
extension AVMetadataItem {
    var title: String? {
        guard let key = commonKey?.rawValue, key == "title" else {
            return nil
        }
        return stringValue
    }
    
    var artist: String? {
        guard let key = commonKey?.rawValue, key == "artist" else {
            return nil
        }
        return stringValue
    }

    var artwork: UIImage? {
        guard let key = commonKey?.rawValue, key == "artwork", let data = dataValue, let image = UIImage(data: data) else {
            return nil
        }
        return image
    }
}

extension AVPlayer {
    var isPlaying: Bool {
        guard self.currentItem != nil else { return false }
        return self.rate != 0
    }
}
