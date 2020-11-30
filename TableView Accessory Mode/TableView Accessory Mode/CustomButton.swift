import UIKit

class CustomButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 5.0;
        self.backgroundColor = UIColor(red: 255/255, green: 132/255, blue: 102/255, alpha: 1)
        self.tintColor = UIColor.white
    }
}
