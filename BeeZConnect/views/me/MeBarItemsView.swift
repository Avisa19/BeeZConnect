

import UIKit


class MeBarItemsView: UIView {
    
    fileprivate let titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Sign in with"
        label.textColor = #colorLiteral(red: 0.265830934, green: 0.1691296995, blue: 0.04577291757, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    fileprivate lazy var facebookButton = createButton(image: #imageLiteral(resourceName: "icons8-facebook_new_filled"), selector: #selector(handleFacebookLogin))
    
    fileprivate lazy var twitterButton = createButton(image: #imageLiteral(resourceName: "icons8-twitter"), selector: #selector(handleTwitterLogin))
    
    fileprivate lazy var googleButton = createButton(image: #imageLiteral(resourceName: "icons8-google_plus_filled"), selector: #selector(handleGoogleLogin))
    
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
}

extension MeBarItemsView {
    fileprivate func createButton(image: UIImage, selector: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }
}
