

import UIKit

class MeFeedCell: BZBaseCell {
    
    override func setupViews() {
        super.setupViews()
        
        contentView.backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: .init(top: 8, left: 8, bottom: 100, right: 8))
    }
}
