import UIKit
import AVFoundation

class TrackManager{
    /*
     1. Track Load해오기 [정확히는 AVPlayerItem 형태로 가져오기]
     2. AVPlayerItem -> Track 변경 후, Track에 맞는 Data주입
     */
    var tracks : [AVPlayerItem] = []
    
    init() {
        let _tracks = loadTracks()
        self.tracks = _tracks
    }
    
    func loadTracks() -> [AVPlayerItem]{
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map{ url in
            return AVPlayerItem(url: url)
        }
        return items
    }
    
    func track(_ index : Int) -> Track?{
        let item = self.tracks[index]
        return item.convertToTrack()
    }

}
