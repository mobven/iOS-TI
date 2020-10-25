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
    
    static var baseUrl: String? {
        return Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String
    }
    
    static let BASE_URL = baseUrl // "https://api.github.com/gists/public"
    
    var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try API.BASE_URL!.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}
