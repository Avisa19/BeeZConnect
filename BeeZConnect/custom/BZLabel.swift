

import UIKit

class BZLabel: UILabel {
    
    init(title: String = "Default text", textColor: UIColor = UIColor.honeyTextZero, textAlign: NSTextAlignment = .left, size: CGFloat = 16, frame: CGRect = .zero) {
        super.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.text = title
        self.textAlignment = textAlign
        self.textColor = textColor
        self.font = UIFont.init(name: "Oswald-Regular.ttf", size: size)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
