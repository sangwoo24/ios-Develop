import Foundation
import AVFoundation

struct NormalAlarm {
    var isOn: Bool
    var label: String
    var time: String
    var day: [Int]
    var soundURL: URL
}

struct QuickAlarm {
    var time: Int
}
