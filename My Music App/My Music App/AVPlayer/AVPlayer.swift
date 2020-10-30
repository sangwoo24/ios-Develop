import AVFoundation
import UIKit

extension AVPlayerItem{
    func convertToTrack() -> Track?{
        let metadataList = asset.metadata
        
        var trackName : String?
        var artistName : String?
        var trackImage : UIImage?
    
        for metadata in metadataList{
            if let track = metadata.trackName{
                trackName = track
            }
            
            if let artist = metadata.artistName{
                artistName = artist
            }
            
            if let image = metadata.trackImage{
                trackImage = image
            }
        }
        
        guard let track = trackName,
              let artist = artistName,
              let image = trackImage else{
            return nil
        }
        return Track(trackName : track, artistName : artist, trackImage : image)
    }
}

extension AVMetadataItem{
    var trackName : String?{
        guard let key = commonKey?.rawValue, key == "trackName" else{
            return nil
        }
        return stringValue
    }
    
    var artistName : String?{
        guard let key = commonKey?.rawValue, key == "artistName" else{
            return nil
        }
        return stringValue
    }
    
    var trackImage : UIImage?{
        guard let key = commonKey?.rawValue, key == "trackImage", let data = dataValue, let image = UIImage(data: data) else{
            return nil
        }
        return image
    }
}

