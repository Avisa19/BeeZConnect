

import UIKit

class GDTextField: UITextField {
    
    var insets: UIEdgeInsets!
    
    init(frame: CGRect = .zero, placeholder: String = "placeholder", cornerRadius: CGFloat = 4, leftInset: CGFloat = 0) {
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.placeholder = placeholder
        self.layer.cornerRadius = cornerRadius
        self.insets = .init(top: 0, left: leftInset, bottom: 0, right: 0)
        self.textColor = UIColor.gdGreen
        self.backgroundColor = .white
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insets)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
