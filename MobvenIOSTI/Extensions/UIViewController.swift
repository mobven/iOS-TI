//
//  UIViewController.swift
//  MobvenIOSTI
//
//  Created by Eren Erinanc on 10.07.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import UIKit
import SafariServices


extension UIViewController {
    
    func presentSafariViewController(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
