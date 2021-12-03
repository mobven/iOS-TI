//
//  GistsWorker.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import Alamofire

final class GistsWorker {
    
    func getGists(completionHandler: @escaping ((_ result: Result<Any,AFError>) -> Void)) {
        AF.request(API.gists).validate().responseJSON { (response) in
            print(response)
            switch response.result {
            case .success(_ ):
                completionHandler(response.result)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
