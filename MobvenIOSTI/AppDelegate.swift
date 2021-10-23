//
//  AppDelegate.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    override init() {
           super.init()
           UIViewController.classInit
       }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        VersionConfig.shared?.show()
        return true
    }
    
}

