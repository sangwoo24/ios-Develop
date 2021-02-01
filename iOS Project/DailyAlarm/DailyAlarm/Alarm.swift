import Foundation
import AVFoundation

struct NormalAlarm {
    var isOn: Bool
    var label: String
    var time: String
    var day: [Int]
}

struct QuickAlarm {
    var time: Int
    var isOn: Bool
}
