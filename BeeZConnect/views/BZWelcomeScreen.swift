

import UIKit


class BZWelcomeScreenView: BZGradientLayer {
    
    fileprivate let infoLabel = BZLabel(title: "WELCOME TO BeeZConnect",textColor: UIColor.honeyTextOne, textAlign: .center, size: 100)
    
    fileprivate let copyRight = BZLabel(title: "© 2020 | Avisa", textColor: UIColor.honeyTextOne, textAlign: .center, size: 14)
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(infoLabel)
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -50).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        addSubview(copyRight)
        copyRight.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        copyRight.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
        copyRight.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyRight.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
