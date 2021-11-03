//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Cihan on 3.11.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

extension UIViewController {
    static let classInit: Void = {
        let originalSelector = #selector(viewDidAppear(_:))
        let swizzledSelector = #selector(swizzledViewDidAppear(_:))
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()

    @objc func swizzledViewDidAppear(_ animated: Bool) {
        VersionConfig.shared?.show()
        swizzledViewDidAppear(animated)
    }
}
