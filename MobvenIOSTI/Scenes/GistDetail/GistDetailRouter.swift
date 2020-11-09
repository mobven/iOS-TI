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
  func routeToSafari()
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
 
  func routeToSafari() {
    guard let urlStr = self.dataStore?.selectedGist.url, let url = URL(string: urlStr) else {
      return
    }
    
    let vc = SFSafariViewController(url: url)
    vc.modalPresentationStyle = .fullScreen
    self.viewController?.present(vc, animated: true, completion: nil)
  }
}
