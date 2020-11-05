import AVFoundation

class SimplePlayer{
    static let shared = SimplePlayer()
    private let player = AVPlayer()

    init() {}

    func play(){
        player.play()
    }
    
    func pause(){
        player.pause()
    }
    
    func seek(to time:CMTime) {
        // TODO: seek구현
        player.seek(to: time)
    }
    
    func isPlaying() -> Bool{
        return player.isPlaying
    }
    
    func currentItem() -> AVPlayerItem?{
        return player.currentItem
    }
    
    func totalDurationTime() -> Double{
        return player.currentItem?.duration.seconds ?? 0
    }
    
    func currentTime() -> Double{
        return player.currentItem?.currentTime().seconds ?? 0
    }
    
    func replaceCurrentItem(with item : AVPlayerItem?){
        player.replaceCurrentItem(with: item)
    }
    
    func addPeriodcTimeObserver(forInterval : CMTime, queue : DispatchQueue?, using : @escaping (CMTime) -> Void){
        player.addPeriodicTimeObserver(forInterval: forInterval, queue: queue, using: using)
    }
}
