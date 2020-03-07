

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewControllers = [
            templateViewController(viewController: EventsController(), selectedImage: #imageLiteral(resourceName: "icons8-honeycombs_filled").withRenderingMode(.alwaysOriginal), image: #imageLiteral(resourceName: "icons8-honeycombs_2").withRenderingMode(.alwaysOriginal), title: "Events"),
            UIViewController(),
            UIViewController(),
        ]
    }


}

extension TabBarController {
    
    // create a template for adding VC into tabBar menu Items
    fileprivate func templateViewController(viewController: UIViewController, selectedImage: UIImage, image: UIImage, title: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.tabBarItem.selectedImage = selectedImage
        return navController
    }
}

