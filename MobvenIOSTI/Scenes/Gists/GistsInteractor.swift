//
//  GistsInteractor.swift
//  MobvenIOSTI
//
//  Created by Burak Yılmaz on 9.09.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation

protocol GistsBusinessLogic: AnyObject {
    func fetchGists(request: Gists.Fetch.Request)
    func fetchShowDetail(request: Gists.ShowDetail.Request)
    func updateGist(_ gist: Gist)
}

protocol GistsDataStore: AnyObject {
    var gists: [Gist] { get }
    var selectedGist: Gist? { get }
}

class GistsInteractor: GistsBusinessLogic, GistsDataStore {
    
    var presenter: GistsPresentationLogic?
    var worker: GistsWorker = GistsWorker()
    
    var gists: [Gist] = []
    var selectedGist: Gist?
    
    func fetchGists(request: Gists.Fetch.Request) {
        worker.getGists { [weak self] (result) in
            switch result {
            case .success(let gists):
                do {
                    let data = try JSONSerialization.data(withJSONObject: gists, options: .prettyPrinted)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode([Gist].self, from: data)
                    
                    self?.gists = result
                    self?.presenter?.presentGists(response: Gists.Fetch.Response(gists: result))
                } catch {
                    print("Error occurred")
                }
                
            case .failure(let error):
                print("error while something. \(error.localizedDescription)")
            }
        }
    }
    
    func fetchShowDetail(request: Gists.ShowDetail.Request) {
        self.selectedGist = gists[request.index]
        presenter?.presentShowDetail(response: Gists.ShowDetail.Response())
    }
    
    func updateGist(_ gist: Gist) {
        if let index = gists.firstIndex(where: { $0.url == gist.url }) {
            gists[index] = gist
        }
    }
    
}
