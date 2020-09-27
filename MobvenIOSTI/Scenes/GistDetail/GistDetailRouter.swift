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
	func presentSafari()
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

	func presentSafari() {
		guard let urlPath = dataStore?.selectedGist.url, let url = URL(string: urlPath)  else { return }
		let config = SFSafariViewController.Configuration()
		config.entersReaderIfAvailable = true

		let vc = SFSafariViewController(url: url, configuration: config)
		viewController?.modalPresentationStyle = .fullScreen
		viewController?.present(vc, animated: true)
	}

}
