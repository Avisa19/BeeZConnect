
import UIKit

class GDLabel: UILabel {
    
    init(frame: CGRect = .zero, title: String = "Default name", textAlign: NSTextAlignment = .left, textColor: UIColor = .gdTextGreen, size: CGFloat = 14) {
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.text = title
        self.textAlignment = textAlign
        self.textColor = textColor
        
        self.font = UIFont.init(name: "Oswald-Regular", size: size)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
