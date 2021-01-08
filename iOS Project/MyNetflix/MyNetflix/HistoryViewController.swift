import UIKit
import Firebase

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableVIew: UITableView!
    
    let db = Database.database().reference().child("searchHistory")
    var searchTerms: [searchTerm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        db.observeSingleEvent(of: .value) { snapshot in
            guard let searchHistory = snapshot.value as? [String: Any] else { return }
            
            do {
                let data = try JSONSerialization.data(withJSONObject: Array(searchHistory.values), options: [])
                let decoder = JSONDecoder()
                let searchTerms = try decoder.decode([searchTerm].self, from: data)
                self.searchTerms = searchTerms.sorted { $0.timestamp > $1.timestamp }
    
                self.tableVIew.reloadData()
            } catch let error {
                print("--> error: \(error.localizedDescription)")
            }
        }
    }
}


class HistoryCell: UITableViewCell {
    @IBOutlet weak var searchTerm: UILabel!
}

extension HistoryViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as? HistoryCell else { return UITableViewCell() }
        
        cell.searchTerm.text = searchTerms[indexPath.row].term
        return cell
    }
}

struct searchTerm: Codable {
    let term: String
    let timestamp: TimeInterval
}
