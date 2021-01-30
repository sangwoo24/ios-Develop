import Foundation
import AVFoundation

struct NormalAlarm {
    var isOn: Bool
    var label: String
    var time: String
    var day: [Int]
    var soundID: SystemSoundID
}

struct QuickAlarm {
    var time: Int
}
