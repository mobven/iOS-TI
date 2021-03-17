//
//  GistDetailRouter.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import SafariServices

protocol GistDetailRoutingLogic: class {
    func updateFavoriteRouting()
    func routeToSafari(url: String)
}

protocol GistDetailDataPassing: class {
    var dataStore: GistDetailDataStore? { get }
    var delegate : GistDetailFavoriteDelegate? { get set }
}

final class GistDetailRouter: GistDetailRoutingLogic, GistDetailDataPassing {
    
    func routeToSafari(url: String) {
        if let url = URL(string: url) {
               let config = SFSafariViewController.Configuration()
               config.entersReaderIfAvailable = true

               let vc = SFSafariViewController(url: url, configuration: config)
            viewController?.present(vc, animated: true)
           }
    }
    
    
    weak var viewController: GistDetailViewController?
    var dataStore: GistDetailDataStore?
    
    var delegate: GistDetailFavoriteDelegate?
    
    func updateFavoriteRouting() {
        guard let gist = dataStore?.selectedGist else { return }
        delegate?.gistDetailFavoriteUpdatedGist(gist)
    }
    
}
