//
//  SceneDelegate.swift
//  BeeZConnect
//
//  Created by Avisa Poshtkouhi on 3/5/20.
//  Copyright © 2020 Avisa Poshtkouhi. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let bg = BZWelcomeScreenView()
        guard let window = window else { return }
        bg.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            self.setupMainScreen()
            bg.removeFromSuperview()
        }
        
    }
    
    func setupMainScreen() {
        
        let tabBarVc = TabBarController()
        tabBarVc.tabBar.barTintColor = #colorLiteral(red: 0.8549915552, green: 0.6130863428, blue: 0.226591289, alpha: 1)
        tabBarVc.tabBar.tintColor = .black
        window?.rootViewController = tabBarVc
        window?.makeKeyAndVisible()
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

