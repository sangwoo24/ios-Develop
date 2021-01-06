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
    var isSeeking : Bool = false
    var timeObserver : Any?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatePlayButtonUI()
        updateTime(time: CMTime.zero)
        
        timeObserver = simplePlayer.addPeriodcTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 10), queue: DispatchQueue.main) { time in
            self.updateTime(time: time)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTrackInfo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        simplePlayer.pause()
        simplePlayer.replaceCurrentItem(with: nil)
    }
    
    func updateTrackInfo(){
        guard let track = simplePlayer.currentItem()?.convertToTrack() else { return }
        trackImage.image = track.trackImage
        trackName.text = track.trackName
        artistName.text = track.artistName
    }
    
    
    func updatePlayButtonUI(){
        if simplePlayer.isPlaying(){
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "pause.fill", withConfiguration: configuration)
            playButton.setImage(image, for: .normal)
        }else{
            let configuration = UIImage.SymbolConfiguration(pointSize: 40)
            let image = UIImage(systemName: "play.fill", withConfiguration: configuration)
            playButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func clickPlayButton(_ sender: Any) {
        if simplePlayer.isPlaying(){
            simplePlayer.pause()
        }else{
            simplePlayer.play()
        }
        updatePlayButtonUI()
    }
    
    @IBAction func seek(_ sender: UISlider) {
        guard let currentItem = simplePlayer.currentItem() else { return }
        let position = Double(sender.value)
        let seconds = position * currentItem.duration.seconds
        let time = CMTime(seconds: seconds, preferredTimescale: 100)
        simplePlayer.seek(to: time)
    }
    
    @IBAction func beginDrag(_ sender: Any) {
        isSeeking = true
    }
    
    @IBAction func endDrag(_ sender: Any) {
        isSeeking = false
    }
    
    func updateTime(time : CMTime){
        currentTime.text = secondsToString(sec: simplePlayer.currentTime())
        totalDuration.text = secondsToString(sec: simplePlayer.totalDurationTime())
    }
    
    func secondsToString(sec : Double) -> String{
        guard sec.isNaN == false else {
            return "00:00"
        }
        let totalSeconds = Int(sec)
        let min = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d", min ,seconds)
    }
}

