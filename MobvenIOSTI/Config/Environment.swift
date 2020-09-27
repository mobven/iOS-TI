//
//  Environment.swift
//  MobvenIOSTI
//
//  Created by Huseyin inan on 27.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

public enum Environment {
	private static let infoDictionary: [String: Any] = {
		guard let dict = Bundle.main.infoDictionary else {
			fatalError("Plist file not found")
		}
		return dict
	}()

	static let baseURL: URL = {
		guard let rootURLstring = Environment.infoDictionary["BASE_URL"] as? String else {
			fatalError("Root URL not set in plist for this environment")
		}
		guard let url = URL(string: rootURLstring) else {
			fatalError("Root URL is invalid")
		}
		return url
	}()
}
