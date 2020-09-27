//
//  ViewDidLoadInjector.swift
//  MobvenIOSTI
//
//  Created by Huseyin inan on 27.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import ObjectiveC.runtime
import UIKit

class ViewDidLoadInjector {

	typealias ViewDidLoadRef = @convention(c)(UIViewController, Selector) -> Void

	private static let viewDidAppearSelector = #selector(UIViewController.viewDidAppear(_:))

	static func inject(into supportedClasses: [UIViewController.Type], injection: @escaping (UIViewController) -> Void) {
		guard let originalMethod = class_getInstanceMethod(UIViewController.self, viewDidAppearSelector) else {
			fatalError("\(viewDidAppearSelector) must be implemented")
		}

		var originalIMP: IMP? = nil

		let swizzledViewDidLoadBlock: @convention(block) (UIViewController) -> Void = { receiver in
			if let originalIMP = originalIMP {
				let castedIMP = unsafeBitCast(originalIMP, to: ViewDidLoadRef.self)
				castedIMP(receiver, viewDidAppearSelector)
			}

			if ViewDidLoadInjector.canInject(to: receiver, supportedClasses: supportedClasses) {
				injection(receiver)
			}
		}

		let swizzledIMP = imp_implementationWithBlock(unsafeBitCast(swizzledViewDidLoadBlock, to: AnyObject.self))
		originalIMP = method_setImplementation(originalMethod, swizzledIMP)
	}

	private static func canInject(to receiver: Any, supportedClasses: [UIViewController.Type]) -> Bool {
		let supportedClassesIDs = supportedClasses.map { ObjectIdentifier($0) }
		let receiverType = type(of: receiver)
		return supportedClassesIDs.contains(ObjectIdentifier(receiverType))
	}
}
