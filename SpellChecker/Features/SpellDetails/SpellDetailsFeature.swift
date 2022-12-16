//
//  SpellDetailsFeature.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class SpellDetailsFeature: SpellDetailsModel {
    
    enum LoadError: Error {
        case requestFailed, invalidData
    }
    
    init(api: RemoteAPI, client: HTTPClient) {
        self.api = api
        self.client = client
    }
        
    func loadSpell(spellIdentifier: String, completion: @escaping (LoadResult) -> Void) {
        let url = api.getSpellDetailsURL(spellIdentifier: spellIdentifier)
        
        client.getRequest(url: url) { result in
            switch result {
            case .failure(let error):
                print(error)
                completion(.failure(.requestFailed))
            case .success(let data):
                do {
                    let spell = try JSONDecoder().decode(Spell.self, from: data)
                    completion(.success(spell))
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
}

extension RemoteAPI {
    func getSpellDetailsURL(spellIdentifier: String) -> URL {
        let path = "/spells/\(spellIdentifier)"
        return urlWithPath(path)!
    }
}
