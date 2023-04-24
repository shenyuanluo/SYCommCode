//
//  AppDelegate.swift
//  Sec01_CommonExtension
//
//  Created by ShenYuanLuo on 2023/3/17.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let navc = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navc
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

