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
    
    static let BASE_URL = (Bundle.main.infoDictionary?["API"] as? String)?.replacingOccurrences(of: "\\", with: "")
    
    var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let url = try API.BASE_URL?.asURL() else { return URLRequest(url: URL(string: "")!) }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}
