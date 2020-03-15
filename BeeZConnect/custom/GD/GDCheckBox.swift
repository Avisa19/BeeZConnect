

import UIKit

class GDCheckBox: UIButton {
    
    var id: Int?
    
    fileprivate func toggledBox(_ isToggled: Bool) {
        UIView.animate(withDuration: 0.2) {
            if isToggled {
                self.backgroundColor = UIColor.gdGreen
            } else {
                self.backgroundColor = .clear
            }
        }
    }
    
    var isToggled: Bool? {
        didSet {
            if let isToggled = isToggled {
                toggledBox(isToggled)
            }
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gdGreen.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
