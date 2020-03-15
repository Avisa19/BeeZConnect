
import UIKit

class BZButton: UIButton {
    
    var image: UIImage!
    init(image: UIImage = #imageLiteral(resourceName: "icons8-bumblebee"), frame: CGRect = .zero) {
        super.init(frame: frame)
        checkIfFrameZero()
        self.image = image
        phaseTwo()
    }
    
    func phaseTwo() {
        self.setImage(image, for: .normal)
        self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.clipsToBounds = true
        self.imageView?.tintColor = UIColor.honeyTextOne
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
