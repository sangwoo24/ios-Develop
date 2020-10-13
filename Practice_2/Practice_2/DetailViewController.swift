//
//  DetailViewController.swift
//  Practice_2
//
//  Created by 석상우 on 2020/10/13.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name : String?
    var bounty : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    func setView(){
        if let name = self.name, let bounty = self.bounty{
            let img = UIImage(named: "\(name).jpg")
            image.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
