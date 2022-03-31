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
    func openWebView()
}

protocol GistDetailDataPassing: class {
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
    
    func openWebView() {
        if let url = URL(string: dataStore?.selectedGist.url ?? "") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                let vc = SFSafariViewController(url: url, configuration: config)
                viewController?.present(vc, animated: true)
            }
    }
    
}


