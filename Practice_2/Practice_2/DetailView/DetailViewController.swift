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
    
    //animation 'on'
    override func viewDidAppear(_ animated: Bool) {
        showAnimation()
    }

    private func prepareAnimation(){
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).scaledBy(x: 3, y: 3).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    private func showAnimation(){
//        nameLabelCenterX.constant = 0
//        bountyLabelCenterX.constant = 0
        
//        UIView.animate(withDuration: 0.3){
//            self.view.layoutIfNeeded()
//            //layout을 다시 해야 할 필요가 있다면 해라
//        }
//
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

