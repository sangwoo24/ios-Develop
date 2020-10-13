import UIKit

class BountyViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {

    let viewModel = BountyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                let bountyInfo = viewModel.bountyInfoOfIndex(index: index)
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    //UITableViewDataSource
    //셀의 개수, 어떻게 보여지는지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfBountyList()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }

        let bountyInfo_idx = viewModel.bountyInfoOfIndex(index: indexPath.row)
        cell.setCell(info: bountyInfo_idx)
        
        return cell
    }
    
    //UITableViewDelegate
    //클릭이 됐을 때 이 code로 응답할거야
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
}

//Create Custom Cell
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func setCell(info : BountyInfo){
        imageView?.image = info.getImageInfo()
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}




