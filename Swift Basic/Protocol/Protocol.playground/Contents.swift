import UIKit


protocol Sendable {
    var from: String { get }
    var to: String? { get set }
    
    func send()
}

struct Mail: Sendable {
    var from: String
    var _to: String?
    var to: String? {
        get {
            return self._to
        }
        set {
            self._to = newValue
        }
    }
    
    func send() {
        print("Send a mail [from]: \(self.from) [to]: \(self.to ?? "Nobody")")
    }
}

func sendAnything(_ sendable: Sendable) {
    sendable.send()
}

var mail = Mail(from: "tjrtkddnaos@naver.com")
mail.to = "tjtkddn24@kpu.ac.kr"
sendAnything(mail)
