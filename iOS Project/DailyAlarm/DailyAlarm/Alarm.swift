import Foundation
import AVFoundation

struct Alarm {
    var isOn: Bool
    var label: String
    var time: String
    var day: [Int]
    var soundID: SystemSoundID
    var rep: Int
}
