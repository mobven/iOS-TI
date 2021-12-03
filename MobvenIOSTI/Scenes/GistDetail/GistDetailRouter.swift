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
    func showToGistUrl()
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
    
    func showToGistUrl(){
        guard let urlString = dataStore?.selectedGist.url, let url = URL(string: urlString) else { return }
        let safari = SFSafariViewController(url: url)
        safari.modalPresentationStyle = .overFullScreen
        viewController?.present(safari, animated: true, completion: nil)
    }
    
}
