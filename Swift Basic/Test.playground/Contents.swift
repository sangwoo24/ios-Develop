import Foundation

let timeInterval = NSDate().timeIntervalSince1970

// hourly : 7:58
let date = Date(timeIntervalSince1970: timeInterval)
let formatter = DateFormatter()
formatter.dateFormat = "eeee HH:mm"
formatter.locale = Locale(identifier: "ko")
let localDate = formatter.string(from: date)
print(localDate)

// daily : 19(월)
