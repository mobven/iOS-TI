//
//  Environment.swift
//  MobvenIOSTI
//
//  Created by pttem-ios on 16.12.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

enum Environment {
  // MARK: - Keys
  enum Keys {
    static let baseUrl = "BASE_URL"
  }
  // MARK: - Plist
  private static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()
  // MARK: - Plist values
  static let baseUrl: URL = {
    guard let rootURLstring = Environment.infoDictionary[Keys.baseUrl] as? String else {
      fatalError("Base URL not set in plist for this environment")
    }
    guard let url = URL(string: rootURLstring) else {
      fatalError("Base URL is invalid")
    }
    return url
  }()
}
