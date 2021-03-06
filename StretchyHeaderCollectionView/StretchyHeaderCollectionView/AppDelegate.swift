//
//  AppDelegate.swift
//  StretchyHeaderCollectionView
//
//  Created by wonkwh on 23/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = StretchyHeaderController(collectionViewLayout: UICollectionViewFlowLayout())
        return true
    }
}

