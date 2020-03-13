

import UIKit


class MeBarItemsView: UIView {
    
    var delegate: BZGetItDoneDelegate?
    
    fileprivate let titleLabel = BZLabel(title: "Sign in with", textColor: UIColor.honeyTextOne, textAlign: .center, size: 14)
    
    fileprivate lazy var facebookButton = BZButton(image: #imageLiteral(resourceName: "icons8-facebook_new_filled"))
    
    fileprivate lazy var twitterButton = BZButton(image: #imageLiteral(resourceName: "icons8-twitter"))
    
    fileprivate lazy var googleButton = BZButton(image: #imageLiteral(resourceName: "icons8-google_plus_filled"))
    
    fileprivate lazy var settingButton = BZButton(image: #imageLiteral(resourceName: "icons8-frisbee_disk"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.8397607207, green: 0.6014199257, blue: 0.2217980623, alpha: 1)
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [facebookButton, twitterButton, googleButton])
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 16
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(settingButton)
        settingButton.translatesAutoresizingMaskIntoConstraints = false
        settingButton.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        settingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        settingButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        settingButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        facebookButton.addTarget(self, action: #selector(handleFacebookLogin), for: .touchUpInside)
        twitterButton.addTarget(self, action: #selector(handleTwitterLogin), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(handleGoogleLogin), for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(handleSetting), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MeBarItemsView {
    
    @objc fileprivate func handleGoogleLogin() {
        print("handle login...")
    }
    
    @objc fileprivate func handleTwitterLogin() {
        print("handle login...")
    }
    
    @objc fileprivate func handleFacebookLogin() {
        print("handle login...")
    }
    
    @objc fileprivate func handleSetting() {
        if let delegate = self.delegate {
            delegate.didAddNewVC()
        }
    }
}


