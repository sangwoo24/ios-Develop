import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!

    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        prepareAnimation()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        //현상금에 따라 애니메이션 다르게 설정해보기
        if let bounty = viewModel.bountyInfo{
            if bounty.bounty >= 10000000{
                showHighBounty();
            }else{
                showAnimation()
            }
        }
    }
    
    
    private func showHighBounty(){
        UIView.transition(with: image, duration: 0.3, options: .transitionCurlDown, animations: nil, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.2, usingSpringWithDamping: 1.0, initialSpringVelocity: 3, options:.allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.5, usingSpringWithDamping: 3.0, initialSpringVelocity: 1, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
        }, completion: nil)
        
        nameLabel.alpha = 1
        bountyLabel.alpha = 1
    }
    
    
    private func prepareAnimation(){
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    
    private func showAnimation(){
        UIView.transition(with: image, duration: 0.3 , options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            //변형을 가하기 전의 상태
            self.nameLabel.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.4, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            //변형을 가하기 전의 상태
            self.bountyLabel.transform = CGAffineTransform.identity
        }, completion: nil)
        
        nameLabel.alpha = 1
        bountyLabel.alpha = 1
        
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setView(){
        if let bountyInfo = viewModel.bountyInfo{
            image.image = UIImage(named: "\(bountyInfo.name).jpg")
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
}

