//
//  BountyViewController.swift
//  Practice_2
//
//  Created by 석상우 on 2020/10/07.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let nameList = ["brook", "chopper", "franky","luffy","nami","robin","sanji","zoro"]
    let bountyList = [33000000,50,44400000,123123,123123123,124124214,124124,12412412424]
    
    //UITableViewDataSource
    //셀의 개수, 어떻게 보여지는지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imageView?.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
    
    //UITableViewDelegate
    //클릭이 됐을 때 이 code로 응답할거야
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}

//Create Custom Cell
class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
