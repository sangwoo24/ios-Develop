import Foundation

// open
open class OpenClass {
    public init() {}
}


// public
public class PublicClass {
    public init() {}
}


// file private
fileprivate class FilePrivateClass{
    public init() {}
}

fileprivate var filePriavateInstance = FilePrivateClass() // 접근 수준이 file private 이기 때문에, 변수도 file private, private 형식으로 선언해야함.


// private
private class PrivateClass {
    public init() {}
    private var name = "sangwoo"
}

private let privateInstance = PrivateClass() // ok
//print(privateInstance.name) // error


// private(set)
protocol Car {
    var carName: String { get }
}

struct CarModel: Car {
    private(set) var carName: String
}
