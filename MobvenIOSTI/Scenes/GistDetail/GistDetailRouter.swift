//
//  GistDetailRouter.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

protocol GistDetailRoutingLogic: AnyObject {
    func updateFavoriteRouting()
}

protocol GistDetailDataPassing: AnyObject {
    var dataStore: GistDetailDataStore? { get }
    var delegate : GistDetailFavoriteDelegate? { get set }
}

final class GistDetailRouter: GistDetailRoutingLogic, GistDetailDataPassing {
    
    weak var viewController: GistDetailViewController?
    var dataStore: GistDetailDataStore?
    
    var delegate: GistDetailFavoriteDelegate?
    
    func updateFavoriteRouting() {
        guard let gist = dataStore?.selectedGist else { return }
        delegate?.gistDetailFavoriteUpdatedGist(gist)
    }
    
}
