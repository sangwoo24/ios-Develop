import Foundation

UIView.animate(withDuration: 0.5, animations: {
    self.floatingDimView.alpha = 0
}){ _ in self.floatingDimView.isHidden = true }
