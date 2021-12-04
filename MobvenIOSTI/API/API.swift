//
//  API.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 10.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import Alamofire

enum API: URLRequestConvertible {
    
    case gists
    
    static let BASE_URL: String = {
        guard let rootURLstring = Environment.infoDictionary["API_URL"] as? String else {
            fatalError("Root URL fail")
        }
        return rootURLstring
    }()
    
    var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try API.BASE_URL.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}


public enum Environment {
    
  static let infoDictionary: [String: Any] = {
    guard let dict = Bundle.main.infoDictionary else {
      fatalError("Plist file not found")
    }
    return dict
  }()
}
