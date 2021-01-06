import UIKit

class HomeViewController: UIViewController {

    let trackManager = TrackManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Track 갯수
        return trackManager.tracks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Cell return
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrackCollectionViewCell", for: indexPath) as? TrackCollectionViewCell else{
            return UICollectionViewCell()
        }
        
        let track = trackManager.track(indexPath.item)
        cell.updateUI(track)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TrackCollectionHeaderView", for: indexPath) as? TrackCollectionHeaderView else{
                return UICollectionReusableView()
            }
            return header
        default:
            return UICollectionReusableView()
        }
    }
}


extension HomeViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.row)
        let playerStoryboard = UIStoryboard.init(name: "Player", bundle: nil)
        guard let playerVC = playerStoryboard.instantiateViewController(identifier: "PlayerViewController") as? PlayerViewController else { return }
        let item = trackManager.tracks[indexPath.item]
        playerVC.simplePlayer.replaceCurrentItem(with : item)
        present(playerVC, animated: true, completion: nil)
    }
}


extension HomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = collectionView.bounds.width - 40
        let height : CGFloat = 100
        return CGSize(width: width, height: height)
    }
}
