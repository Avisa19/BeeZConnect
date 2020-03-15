
import UIKit

class GDButton: UIButton {
    
    fileprivate var title: String!
    fileprivate var size: CGFloat!
    fileprivate var type: ButtonOptions!
    
    init(frame: CGRect = .zero, title: String = "Default Name", type: ButtonOptions, size: CGFloat = 14, cornerRadius: CGFloat = 20) {
        
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.title = title
        self.size = size
        self.type = type
        self.layer.cornerRadius = cornerRadius
        phaseTwo(with: type)
    }
    
    fileprivate func phaseTwo(with type: ButtonOptions) {
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Oswald-Regular", size: size)
        }
        self.backgroundColor = .white
        
        switch type {
        case .roundedText:
            roundedText()
        case .squaredIcon:
            squaredText()
        default:
            break
        }
    }
    
    fileprivate func roundedText() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(UIColor.gdTextGreen, for: .normal)
    }
    
    fileprivate func squaredText() {
        self.layer.cornerRadius = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
