// private(set)
protocol Car {
    var name: String { get }
}

struct CarModel: Car {
    private(set) var name: String
    
    mutating func changeName(newName: String) {
        self.name = newName
    }
}

var model = CarModel(name: "마세라티")
print(model.name)

model.changeName(newName: "벤츠")
print(model.name)

