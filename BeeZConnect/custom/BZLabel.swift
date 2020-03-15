

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

    override var isHighlighted: Bool {
        didSet {
            self.textColor = isHighlighted ? #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
