//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Okan Koçyiğit on 14.12.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
    method_exchangeImplementations(originalMethod!, swizzledMethod!)
}

extension UIViewController {

    static let swizzleInit: Void = {
        let originalSelector = #selector(viewDidAppear(_:))
        let swizzledSelector = #selector(swizzledViewDidAppear(_:))
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()

    @objc func swizzledViewDidAppear(_ animated: Bool) {
        VersionConfig.shared?.show()
        swizzledViewDidAppear(animated)
    }

}
