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
    
    static let BASE_URL =  Config.baseURL  //"https://api.github.com/gists/public"
    
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


enum Configuration {

    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
            case let value as T:
                return value
            case let string as String:
                guard let value = T(string) else { fallthrough }
                return value
            default:
                throw Error.invalidValue
        }
    }
}

enum Config {

    static var baseURL: String {
        let str = try! Configuration.value(for: "BASE_URL") as String
        return str.replacingOccurrences(of: "\\", with: "")
    }
}
