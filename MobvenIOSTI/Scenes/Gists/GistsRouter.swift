//
//  GistsRouter.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import UIKit
import Extension

protocol GistsRoutingLogic: class {
    func routeToGistDetails(delegate: GistDetailFavoriteDelegate)
}

protocol GistsDataPassing: class {
    var dataStore: GistsDataStore? { get }
}

final class GistsRouter: GistsRoutingLogic, GistsDataPassing {
    
    weak var viewController: GistsViewController?
    var dataStore: GistsDataStore?
    
    func routeToGistDetails(delegate: GistDetailFavoriteDelegate) {
        let gistDetailsViewController: GistDetailViewController = UIApplication.getViewController()
        gistDetailsViewController.router?.dataStore?.selectedGist = self.dataStore?.selectedGist
        gistDetailsViewController.router?.delegate = delegate
        viewController?.navigationController?.pushViewController(gistDetailsViewController, animated: true)
    }
    
}
