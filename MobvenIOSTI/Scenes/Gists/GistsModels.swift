//
//  GistsModels.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

// swiftlint:disable nesting
enum Gists {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var gists: [Gist]
        }
        
        struct ViewModel {
            
            var gists: [Gists.Fetch.ViewModel.Gist] = []
            
            struct Gist {
                var id: String?
                var description: String?
                var date: String?
                var comments: Int
                var isFavorite: Bool = false
            }
            
        }
        
    }
    
    enum ShowDetail {
        
        struct Request {
            var index: Int
        }
        
        struct Response {
            
        }
        
        struct ViewModel {
            
        }
        
    }
    
}
// swiftlint:enable nesting
