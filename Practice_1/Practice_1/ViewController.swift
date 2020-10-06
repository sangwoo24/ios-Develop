//
//  ViewController.swift
//  Practice_1
//
//  Created by 석상우 on 2020/10/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceLable: UILabel!
    var currentValue = Int(arc4random_uniform(10000) + 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    @IBAction func testButton(_ sender: Any) {
        let message = "가격은 \(currentValue)원 입니다"
        let alert2 = UIAlertController(title: "나는 바보입니까?", message: message, preferredStyle: .alert)
        
        //ok 버튼을 눌렀을 때 refresh 되도록 closure 사용해야함.
        let action2 = UIAlertAction(title: "네", style: .default, handler: {action in
            self.refresh()
        })
        alert2.addAction(action2)
        present(alert2, animated: true, completion: nil)
    
        
    }
    
    func refresh(){
        let randomPrice = arc4random_uniform(10000) + 1 // (0 ~ 9999) + 1
        currentValue = Int(randomPrice)
        priceLable.text = " \(currentValue)원"
    }
}

