//
//  GistDetailModels.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit

// swiftlint:disable nesting
enum GistDetail {
    
    enum UpdateFavorite {
        struct Request {
            let toggle: Bool
        }
        struct Response {
            var isFavorite: Bool
        }
        struct ViewModel {
            let image: UIImage?
        }
    }
    
    enum OpenSelectedGist {
        struct Request {
        }
        struct Response {
            let url: String
        }
        struct ViewModel {
            let url: String
        }
    }
    
    enum FetchDetail {
        struct Request {
            
        }
        struct Response {
            var gist: Gist
        }
        struct ViewModel {
            var imageURL: String
            var id: String?
            var url: String?
            var date: String?
            var description: String?
            var comments: String?
        }
    }
    
}
// swiftlint:enable nesting

