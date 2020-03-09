

import UIKit


class BZGradientLayer: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = #colorLiteral(red: 0.6327777505, green: 0.5805612206, blue: 0.4803093076, alpha: 1)
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = [UIColor.honeyZero.cgColor, UIColor.honeyTwo.cgColor]
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
