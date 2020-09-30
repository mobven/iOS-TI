//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Samet MACİT on 30.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

extension UIViewController {

    @objc func viewDidAppearOverride(_ animated: Bool) {
        self.viewDidAppearOverride(animated)

        VersionConfig.shared?.show()

    }

    static func swizzleViewWDidAppear() {
        if self != UIViewController.self {
            return
        }
        let originalSelector = #selector(UIViewController.viewDidAppear(_:))
        let swizzledSelector = #selector(UIViewController.viewDidAppearOverride(_:))
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
            let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
