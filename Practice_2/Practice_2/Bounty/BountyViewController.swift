import UIKit

class BountyViewController: UIViewController, UICollectionViewDataSource ,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfBountyList()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCell", for: indexPath) as? GridCell else {
            return UICollectionViewCell()
        }
        let bountyInfo_idx = viewModel.bountyInfoOfIndex(index: indexPath.item)
        cell.setCell(info: bountyInfo_idx)
        return cell
    }
    
    //Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.item)
    }
    
    //Delegate Flow Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSpacing : CGFloat = 10
        let textArea : CGFloat = 65
        
        let width : CGFloat = (collectionView.bounds.width - cellSpacing) / 2
        let height : CGFloat = width * (10/7) + textArea
        
        return CGSize(width: width, height: height)
    }
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
}



class GridCell: UICollectionViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func setCell(info : BountyInfo){
        imgView?.image = info.getImageInfo()
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}
