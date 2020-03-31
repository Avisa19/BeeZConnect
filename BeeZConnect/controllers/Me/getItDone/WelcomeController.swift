
import UIKit

class WelcomeController: UIViewController {
    
    fileprivate lazy var welcomeView: GDGradientWelcomeView = {
        let view = GDGradientWelcomeView(cornerRadius: 16)
        view.delegate = self
        return view
    }()
    
    fileprivate let copyRight = BZLabel(title: "© 2020 | Avisa", textColor: UIColor.honeyTextZero, textAlign: .center, size: 14)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set(true, forKey: "welcome-controller-visited")
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
        
        view.addSubview(copyRight)
        copyRight.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyRight.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12).isActive = true
        copyRight.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyRight.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}

extension WelcomeController: GDWelcomeView {
    func didTapButton() {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.welcomeView.nextButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                self.welcomeView.nextButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }) { (_) in
                let listController = ListController()
                self.present(listController, animated: true, completion: nil)
            }
        }
    }
    
}
