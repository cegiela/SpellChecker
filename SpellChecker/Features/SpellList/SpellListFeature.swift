//
//  SpellListFeature.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class SpellListFeature: SpellListModel {
    
    enum LoadError: Error {
        case requestFailed, invalidData
    }
    
    init(api: RemoteAPI,
         client: HTTPClient,
         mapper: SpellListMapper) {
        self.api = api
        self.client = client
        self.mapper = mapper
    }
        
    func loadList(characterClassIdentifier: String, completion: @escaping (LoadResult) -> Void) {
        let url = api.getSpellListURL(characterClassIdentifier: characterClassIdentifier)
        
        client.getRequest(url: url) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .failure(let error):
                print(error)
                completion(.failure(.requestFailed))
            case .success(let data):
                do {
                    let list = try self.mapper.map(data: data)
                    completion(.success(list))
                } catch let error {
                    print(error)
                    completion(.failure(.invalidData))
                }
            }
        }
    }
    
    //MARK: - Private
    
    private let api: RemoteAPI
    private let client: HTTPClient
    private let mapper: SpellListMapper
}

extension RemoteAPI {
    func getSpellListURL(characterClassIdentifier: String) -> URL {
        let path = "/classes/\(characterClassIdentifier)/spells"
        return urlWithPath(path)!
    }
}
