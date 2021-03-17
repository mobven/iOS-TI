//
//  GistDetailInteractor.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

protocol GistDetailBusinessLogic: class {
    func fetchGistDetail(request: GistDetail.FetchDetail.Request)
    func updateFavorite(request: GistDetail.UpdateFavorite.Request)
    func openURL(request: GistDetail.OpenSelectedGist.Request)
}

protocol GistDetailDataStore: class {
    var selectedGist: Gist! { get set }
}

class GistDetailInteractor: GistDetailBusinessLogic, GistDetailDataStore {
    
    var presenter: GistDetailPresentationLogic?
    var worker: GistDetailWorker?
    
    var selectedGist: Gist!
    
    func fetchGistDetail(request: GistDetail.FetchDetail.Request) {
        presenter?.presentGistDetail(
            response: GistDetail.FetchDetail.Response(gist: selectedGist)
        )
    }
    
    func updateFavorite(request: GistDetail.UpdateFavorite.Request) {
        if request.toggle {
            selectedGist.isFavorite = !selectedGist.isFavorite
        }
        presenter?.presentUpdateFavorite(
            response: GistDetail.UpdateFavorite.Response(isFavorite: selectedGist.isFavorite)
        )
    }
    
    func openURL(request: GistDetail.OpenSelectedGist.Request) {
        presenter?.presentSelectedGist(response: .init(url: selectedGist.url ?? ""))
    }
    
}
