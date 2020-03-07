

import UIKit

class EventItemsCell: BaseCell {
    
    var text: String? {
        didSet {
            guard let text = text else { return }
            textLabel.text = text
        }
    }
    
    fileprivate let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
