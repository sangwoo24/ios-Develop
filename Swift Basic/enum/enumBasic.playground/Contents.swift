import UIKit

enum Ramen: Int {
    case 신라면 = 1
    case 진라면 = 3, 너구리, 짜빠게티
    
    func print() -> String {
        switch self {
        case .신라면: return "신라면"
        case .진라면: return "진라면"
        case .너구리: return "너구리"
        case .짜빠게티: return "짜빠게티"
        }
    }
}

var sin = Ramen.신라면
sin = .짜빠게티
print(sin.rawValue)


// Optional Type
if let ramen = Ramen(rawValue: 4) {
    print(ramen)
}


enum Person {
    case name(String)
    case id(Int)
    
    func print() -> String {
        switch self {
        case .id(let num):
            return "\(num)"
        case .name(let string):
            return "\(string)"
        }
    }
}

let sangwoo : Person = .name("상우")
print(sangwoo.print())


enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode : Barcode = .upc(1,2,3,4)
productBarcode = .qrCode("sangwoo")

switch productBarcode {
case .upc(let first, let second, let third, let forth):
    print("--> upc: \(first), \(second), \(third), \(forth)")
case let .qrCode(code):
    print("--> qrCode: \(code)")
}

enum Temperature {
    case celcius(Double)
    case fernheit(Double)
    case kelvin(Double)
    
    var celciusValue: Double {
        switch self {
        case let .celcius(value): return value  // == case .celcius(let value): return value
        case let .fernheit(value): return (value - 32) * 5 / 9
        case let .kelvin(value): return value + 273
        }
    }
}

func getTemp(with temp: Temperature) -> Double {
    let value = temp.celciusValue
    print(value)
    return 0
}

var t : Temperature = .fernheit(42)
t = .celcius(42)
print(t)
getTemp(with: t)
