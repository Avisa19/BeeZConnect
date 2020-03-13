

import UIKit


class MeCollectionCell: BZBaseCell {
    
    var title: String? {
        didSet {
            guard let title = title else { return }
            label.text = title
        }
    }
    
    var image: UIImage? {
        didSet {
            guard let image = image else { return }
            iconImageView.image = image
        }
    }
    
    fileprivate let label = BZLabel(textColor: UIColor.honeyTextThree, size: 14)
    
    fileprivate let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            iconImageView.tintColor = isHighlighted ? #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
            label.textColor = isHighlighted ? #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            iconImageView.tintColor = isSelected ?  #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
            label.textColor = isSelected ? #colorLiteral(red: 0.4308766425, green: 0.2761793137, blue: 0.09125658125, alpha: 1) : #colorLiteral(red: 0.6597153544, green: 0.6040559411, blue: 0.5004613996, alpha: 1)
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        contentView.backgroundColor = #colorLiteral(red: 0.928184092, green: 0.7959498763, blue: 0.2721357346, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.928184092, green: 0.7959498763, blue: 0.2721357346, alpha: 1)
        iconImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [iconImageView, label])
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: .init(top: 4, left: 20, bottom: 4, right: 4))
    }
}
