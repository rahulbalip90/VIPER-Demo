//
//  AppDelegate.swift
//  VIPER-Demo
//
//  Created by JustMac on 04/10/22.
//  Copyright © 2022 JustMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let postsList = PostListWireFrame.getViewController()
//
//        let navigationController:UINavigationController = UINavigationController(rootViewController: postsList)
//        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController.navigationBar.shadowImage = UIImage()
//        navigationController.navigationBar.isTranslucent = true
//        navigationController.setNavigationBarHidden(true, animated: false)

//        window = UIWindow(frame: UIScreen.main.bounds)
//        
//        window?.rootViewController = navigationController
//        
//        window?.makeKeyAndVisible()
    
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
}

