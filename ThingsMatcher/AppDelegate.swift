//
//  AppDelegate.swift
//  ThingsMatcher
//
//  Created by Nasir Khan on 27/03/2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        setTabbarAsRoot()
        return true
    }
    
    func setTabbarAsRoot() {
        let vc = AppStoryboard.Home.instance.instantiateViewController(withIdentifier: "TabbarVC")
        self.window?.rootViewController = nil
        self.window?.rootViewController = vc
    }


}

