import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var firstDataLabel: UILabel!
    let db = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        saveBasicTypes()
        fetchCustomers()
        
        // update, delete
        // updateBasicType()
        // deleteBasicType()
    }
    
    func updateLabel() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
        print("--> \(snapshot)")
        let value = snapshot.value as? String ?? ""
        DispatchQueue.main.async {
            self.firstDataLabel.text = value
            }
        }
    }
}

extension ViewController {
    func saveBasicTypes() {
        // Document - Firebase child("key").setValue(value)
        // - string, number, dictionary, array
        
        db.child("int").setValue(3)
        db.child("double").setValue(3.5)
        db.child("string").setValue("안냥하세요")
        db.child("array").setValue(["전","석","김","오"])
        db.child("dict").setValue(["id" : "석상우", "age" : 26, "city" : "경기광주"])
        saveCustomers()
    }
    
    func saveCustomers() {
        // 사용자를 저장
        // 모델 Customer + Book
        
        let books = [Book(title: "Good to Great", author: "Someone"),Book(title: "Haking Growth", author: "sombody")]
        
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        
        let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
        
        let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        
        db.child("Customers").child(customer1.id).setValue(customer1.toDictionary)
        db.child("Customers").child(customer2.id).setValue(customer2.toDictionary)
        db.child("Customers").child(customer3.id).setValue(customer3.toDictionary)
    }
        
}

// MARK: Fetch Data
extension ViewController {
    func fetchCustomers() {
        db.child("Customers").observeSingleEvent(of: .value) { snapshot in
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers : [Customer] = try decoder.decode([Customer].self, from: data)
                
                print("--> count: \(customers.count)")
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController {
    func updateBasicType() {
        /*
        db.child("int").setValue(3)
        db.child("double").setValue(3.5)
        db.child("string").setValue("안냥하세요")
        */
        
        db.updateChildValues(["int" : 6])
        db.updateChildValues(["double" : 6])
        db.updateChildValues(["string" : "hello"])
    }
    
    func deleteBasicType() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("string").removeValue()
    }
}


struct Customer: Codable{
    let id: String
    let name: String
    let books: [Book]
    
    // Object to Dict : Computed Property
    // 결국 내가 원하는 Object 를 Dict 나 Array로 변환 후 DB에 전송한다.
    var toDictionary: [String : Any] {
        let booksArray = books.map { $0.toDictionary }
        let dict: [String : Any] = ["id" : id, "name" : name, "books" : booksArray]
        return dict
    }
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    // Object to Dict : Computed Property
    var toDictionary: [String : Any] {
        let dict: [String : Any] = ["title" : title, "author" : author]
        return dict
    }
}
