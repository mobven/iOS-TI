//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Hakan Ugras on 16.08.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit

extension UIViewController {
    @objc dynamic func _swizzled_viewDidAppear(_ animated: Bool) {
        _swizzled_viewDidAppear(animated)
        VersionConfig.shared?.show()
    }
    
    static func swizzleViewDidAppear() {
        let selector1 = #selector(UIViewController.viewDidAppear(_:))
        let selector2 = #selector(UIViewController._swizzled_viewDidAppear(_:))
        let originalMethod = class_getInstanceMethod(UIViewController.self, selector1)!
        let swizzleMethod = class_getInstanceMethod(UIViewController.self, selector2)!
        method_exchangeImplementations(originalMethod, swizzleMethod)
    }
}
