import Foundation
import UIKit

class CollectionViewController : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    var collectionViewData : [String] = ["apple","among","banana","candy","dev"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Array(Set(collectionViewData.map{ $0.first! })).count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let charactor = Array(Set(collectionViewData.map{ $0.first! })).sorted()[section]
        return collectionViewData.filter{ $0.first! == charactor }.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let charactor = Array(Set(collectionViewData.map{ $0.first! })).sorted()[indexPath.section]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.name?.text = collectionViewData.filter{ $0.first! == charactor }[indexPath.item]
        switch charactor {
        case "a":
            cell.image?.image = UIImage(systemName: "applelogo")
        case "b":
            cell.image?.image = UIImage(systemName: "book")
        case "c":
            cell.image?.image = UIImage(systemName: "command")
        case "d":
            cell.image?.image = UIImage(systemName: "display")
        default:
            cell.image?.image = UIImage(systemName: "pencil")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? CollectionViewHeader else{ return UICollectionReusableView() }
            header.headerName?.text = String(Array(Set(collectionViewData.map{$0.first!})).sorted()[indexPath.section])
            
            switch header.headerName?.text {
            case "a":
                header.backgroundColor = UIColor.systemBlue
            case "b":
                header.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.2, alpha: 1.0)
            case "c":
                header.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
            case "d":
                header.backgroundColor = UIColor.systemGray2
            default:
                header.backgroundColor = UIColor.darkGray
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


