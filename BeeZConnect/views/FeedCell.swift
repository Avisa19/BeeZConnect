
import UIKit


class FeedCell: BZBaseCell {
    
    override func setupViews() {
        super.setupViews()
        contentView.backgroundColor = .gray
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: .init(top: 16, left: 16, bottom: 100, right: 16))
    }
}
