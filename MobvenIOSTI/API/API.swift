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
    
    static let BASE_URL = "https://api.github.com/gists/public"
    
    var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
		var urlString = try Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as! String
		urlString = urlString.replacingOccurrences(of: "\\", with: "")
		let url = URL(string: urlString)
        
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}
