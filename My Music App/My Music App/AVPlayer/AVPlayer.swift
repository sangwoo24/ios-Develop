//import AVFoundation
//import UIKit
//
//extension AVPlayerItem{
//    func convertToTrack() -> Track?{
//        let metadataList = asset.metadata
//
//        var trackName : String?
//        var artistName : String?
//        var trackImage : UIImage?
//
//        for metadata in metadataList{
//            if let track = metadata.trackName{
//                trackName = track
//            }
//
//            if let artist = metadata.artistName{
//                artistName = artist
//            }
//
//            if let image = metadata.trackImage{
//                trackImage = image
//            }
//        }
//
//        guard let track = trackName,
//              let artist = artistName,
//              let image = trackImage else{
//                return nil
//        }
//        return Track(trackName : track, artistName : artist, trackImage : image)
//    }
//}
//
//extension AVMetadataItem{
//    var trackName : String?{
//        guard let key = commonKey?.rawValue, key == "trackName" else{
//            return nil
//        }
//        return stringValue
//    }
//
//    var artistName : String?{
//        guard let key = commonKey?.rawValue, key == "artistName" else{
//            return nil
//        }
//        return stringValue
//    }
//
//    var trackImage : UIImage?{
//        guard let key = commonKey?.rawValue, key == "trackImage", let data = dataValue, let image = UIImage(data: data) else{
//            return nil
//        }
//        return image
//    }
//}


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
