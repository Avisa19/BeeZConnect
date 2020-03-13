
import UIKit

class WelcomeController: UIViewController {
    
    fileprivate lazy var welcomeView: UIView = {
        let view = GDGradientWelcomeView(cornerRadius: 16)
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        let insets: CGFloat = 20
        view.addSubview(welcomeView)
        welcomeView.topAnchor.constraint(equalTo: view.topAnchor, constant: insets).isActive = true
        welcomeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets * -1).isActive = true
        welcomeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets).isActive = true
        welcomeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
}

extension WelcomeController: GDWelcomeView {
    func didTapButton() {
        print("Pressing next button")
    }
    
    
}
