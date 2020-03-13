

import UIKit

class EventItemsCell: BZBaseCell {
    
    var text: String? {
        didSet {
            guard let text = text else { return }
            textLabel.text = text
        }
    }
    
    fileprivate let textLabel = BZLabel(textAlign: .center, size: 8)
    
    override func setupViews() {
        super.setupViews()
        contentView.addSubview(textLabel)
        textLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -6).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: .init(top: 8, left: 0, bottom: 8, right: 0))
    }
}
