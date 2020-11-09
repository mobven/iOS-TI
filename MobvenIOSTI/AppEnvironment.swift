//
//  AppEnvironment.swift
//  MobvenIOSTI
//
//  Created by Hasan Asan on 10.11.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

enum AppEnvironmentType: String {
  case debug = "debug"
  case release = "release"
}

struct AppEnvironment {
  static var current: AppEnvironmentType {
    if let env = Constants.InfoPlist.APP_ENVIRONMENT.valueFromInfoPlist as? String {
      return AppEnvironmentType(rawValue: env) ?? .debug
    }
    
    return .debug
  }
}
