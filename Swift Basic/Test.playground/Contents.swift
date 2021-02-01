import Foundation

class sangwoo {
    static let shared = sangwoo()
    init() {
        print("sangwoo init")
    }
}


class main {
    private let shared = sangwoo.shared
    init() {
        print("main init")
    }
}

let dd = main()
