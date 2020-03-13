

import UIKit


class GDGradientView: UIView {
    
    fileprivate var hexColor = [
        UIColor.gdOrange.cgColor,
        UIColor.gdGreen.cgColor
    ]
    
     init(frame: CGRect = .zero, cornerRadius: CGFloat = 4) {
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = hexColor
            layer.locations = [0.0, 1.2]
        }
        
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
