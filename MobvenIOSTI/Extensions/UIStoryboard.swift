//
//  UIStoryboard.swift
//  MobvenIOSTI
//
//  Created by apple on 24.04.2021.
//  Copyright © 2021 Mobven. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String { return String(describing: self) }
}

extension StoryboardIdentifiable where Self: UIView {
    static var storyboardIdentifier: String { return String(describing: self) }
}

extension UIViewController: StoryboardIdentifiable {}

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(withIdentifier identifier: String = T.storyboardIdentifier) -> T {
        guard let controller = self.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("There is no view controller with \(identifier) identifier")
        }
        
        return controller
    }

    func instantiateViewController<T: RawRepresentable>(withIdentifier identifier: T) -> UIViewController where T.RawValue == String {
        return instantiateViewController(withIdentifier: identifier.rawValue)
    }
}

extension UINib {

    static func instantiate<T: StoryboardIdentifiable>(nibName: String = T.storyboardIdentifier, owner: Any? = nil, options: [AnyHashable: Any]? = nil, bundle: Bundle? = nil) -> T {
        guard let view = UINib(nibName: nibName, bundle: bundle).instantiate(withOwner: owner, options: options as? [UINib.OptionsKey : Any]).first as? T else {
            fatalError("There is no nib with name \(nibName)")
        }

        return view
    }
}
