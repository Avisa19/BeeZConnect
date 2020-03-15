

import UIKit

class GDHeaderView: UIView {
    
    var delegate: GDPopupMenuDelegate?
    
    fileprivate let bg = GDGradientView()
    fileprivate let titleLabel = GDLabel(size: 14)
    fileprivate let subTitleLabel = GDLabel(size: 24)
    fileprivate let addButton = GDButton(title: "+", type: .roundedText, size: 24, cornerRadius: 0)
    var itemLeft: Int = 0 {
        didSet {
            self.subTitleLabel.text = "\(itemLeft) Left"
        }
    }
    
    init(frame: CGRect = .zero, title: String = "Defualt Header", subTitle: String = "Defualt Subtitle", cornerRadius: CGFloat = 16) {
        super.init(frame: frame)
        checkIfFrameZero()
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        addSubview(bg)
        bg.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        bg.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: 20 + 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: bg.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bg.addSubview(subTitleLabel)
        subTitleLabel.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: 20 + 8).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: bg.rightAnchor).isActive = true
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        
        bg.addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subTitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: -20 - 8 - 16).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(self, action: #selector(handleAddButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleAddButton() {
        if let delegate = self.delegate {
            delegate.didOpenPopupMenu()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
