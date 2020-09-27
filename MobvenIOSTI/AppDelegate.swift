//
//  AppDelegate.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit
import SafariServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
		ViewDidLoadInjector.inject(into: [GistsViewController.self, GistDetailViewController.self, SFSafariViewController.self]) { _ in 
			VersionConfig.shared?.show()
		}
        return true
    }
    
}

