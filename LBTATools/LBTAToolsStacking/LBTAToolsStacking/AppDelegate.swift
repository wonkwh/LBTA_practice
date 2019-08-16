//
//  AppDelegate.swift
//  LBTAToolsStacking
//
//  Created by Brian Voong on 5/10/19.
//  Copyright © 2019 Brian Voong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        window?.rootViewController = ViewController(collectionViewLayout: UICollectionViewFlowLayout())
        window?.rootViewController = ViewNodeController()
        
        return true
    }
}

