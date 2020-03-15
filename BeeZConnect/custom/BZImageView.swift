

import UIKit

class BZImageView: UIImageView {
    
    init(frame: CGRect = .zero, contentMode: UIView.ContentMode = .scaleAspectFit, tintColor: UIColor = .honeyTextZero) {
        super.init(frame: frame)
        checkIfFrameZero()
        
        self.contentMode = contentMode
        self.clipsToBounds = true
        self.tintColor = tintColor
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.tintColor = isHighlighted ? #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
