//
//  UIView.swift
//  MobvenIOSTI
//
//  Created by Said Çankıran on 9.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    @objc func swviewDidLoad() {
        VersionConfig.shared?.show()
    }

        static func swizzleViewWillDidLoad() {
        //Make sure This isn't a subclass of UIViewController, So that It applies to all UIViewController childs
            if self != UIViewController.self {
                return
            }
            let originalSelector = #selector(viewDidLoad)
            let swizzledSelector = #selector(swviewDidLoad)
            guard let originalMethod = class_getInstanceMethod(self, originalSelector),
                let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else { return }
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }

