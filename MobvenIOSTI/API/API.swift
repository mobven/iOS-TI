//
//  API.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 10.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error {
    case invalidBaseURL
}

enum API: URLRequestConvertible {
    
    case gists
    
    var method: HTTPMethod {
        switch self {
        case .gists:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        guard let infoDict = Bundle.main.infoDictionary, let urlString = infoDict["BaseURL"] as? String, let scheme = infoDict["BaseURLScheme"] as? String else {
            throw APIError.invalidBaseURL
        }
        let fullURLString = scheme + "//"  + urlString
        guard let url = URL(string: fullURLString) else {
            throw APIError.invalidBaseURL
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
}
