//
//  BountyViewController.swift
//  Practice_2
//
//  Created by 석상우 on 2020/10/07.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {

    
    //implement 같은 것
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //UITableViewDataSource
    //셀의 개수, 어떻게 보여지는지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    //UITableViewDelegate
    //클릭이 됐을 때 이 code로 응답할거야
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}
