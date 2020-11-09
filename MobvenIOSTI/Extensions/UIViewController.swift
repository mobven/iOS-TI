//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Hasan Asan on 9.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import UIKit

extension UIViewController {
  static func swizzleViewDidAppear() {
    let originalSelector = #selector(UIViewController.viewDidLoad)
    let swizzledSelector = #selector(UIViewController.newViewDidAppear(animated:))
    
    guard let originalMethod = class_getInstanceMethod(UIViewController.self, originalSelector),
          let swizzledMethod = class_getInstanceMethod(UIViewController.self, swizzledSelector) else {
      return
    }
    
    let didAddMethod = class_addMethod(self,
                                       originalSelector,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
      class_replaceMethod(self,
                          swizzledSelector,
                          method_getImplementation(originalMethod),
                          method_getTypeEncoding(originalMethod))
    } else {
      method_exchangeImplementations(originalMethod, swizzledMethod);
    }
  }
  
  @objc func newViewDidAppear(animated: Bool) {
    if AppEnvironment.current == .debug {
      VersionConfig.shared?.show()
    }
  }
}
