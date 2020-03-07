

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
       
        
        viewControllers = [
            createNavController(viewController: HomeController(), selectedImage: #imageLiteral(resourceName: "icons8-musicbee_filled"), image: #imageLiteral(resourceName: "icons8-musicbee"), title: "Home"),
            createNavController(viewController: ClassfieldsController(), selectedImage: #imageLiteral(resourceName: "icons8-no_drugs_filled"), image: #imageLiteral(resourceName: "icons8-no_drugs"), title: "Classfields"),
            createNavController(viewController: LawyersController(), selectedImage: #imageLiteral(resourceName: "icons8-beer_keg_filled"), image: #imageLiteral(resourceName: "icons8-beer_keg"), title: "Me"),
        ]
    }
    
    
}

extension TabBarController {
    
    // create a template for adding VC into tabBar menu Items
    fileprivate func createNavController(viewController: UIViewController, selectedImage: UIImage, image: UIImage, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}


/*

 let gradientLayer = CAGradientLayer()


 fileprivate func setupGradientLayer() {

     let topColor = #colorLiteral(red: 0.9336013794, green: 0.35367015, blue: 0.3647806048, alpha: 1)
     let bottomColor = #colorLiteral(red: 0.8945153356, green: 0.2374232709, blue: 0.4596897364, alpha: 1)
     gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
     gradientLayer.locations = [0, 1]
     view.layer.addSublayer(gradientLayer)
     gradientLayer.frame = view.bounds
 }

*/
