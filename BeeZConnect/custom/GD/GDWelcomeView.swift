
import UIKit

class GDGradientWelcomeView: GDGradientView {
    
    var delegate: GDWelcomeView?
    
    fileprivate let titleLabel = GDLabel(title: "Get It Done!", textAlign: .center, size: 24)
    fileprivate let infoLabel: UILabel = {
        let label = GDLabel(title: "WELCOME. GET IT DONE IS A TO DO LIST.\nA REALLY DOPE TO-DO-LIST.", textAlign: .center, size: 20)
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate let nextButton = GDButton(title: "START WINNING", type: .roundedText, size: 14)
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        
        addSubview(infoLabel)
        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        addSubview(nextButton)
        nextButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60).isActive = true
        nextButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
    }
    
    @objc fileprivate func handleNextButton() {
        if let delegate = self.delegate {
            delegate.didTapButton()
        }
    }
}


