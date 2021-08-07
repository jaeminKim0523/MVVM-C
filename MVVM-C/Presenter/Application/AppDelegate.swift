//
//  AppDelegate.swift
//  WantedLibrary
//
//  Created by 김재민 on 2021/07/24.
//

import UIKit

let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController: UINavigationController = UINavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.startSearchViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }


}

