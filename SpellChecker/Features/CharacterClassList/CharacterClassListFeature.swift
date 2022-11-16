//
//  CharacterClassListFeature.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class CharacterClassListFeature {
    enum LoadingError: Error {
        case requestFailed, invalidData
    }
    
    let api: RemoteAPI
    let client: HTTPClient
    let mapper = CharacterClassListMapper()
    
    init(api: RemoteAPI, client: HTTPClient) {
        self.api = api
        self.client = client
    }
    
    typealias LoadResult = Result<[CharacterClassListItem], LoadingError>
    
    func loadList(completion: @escaping (LoadResult) -> Void) {
        let url = api.getCharacterClassListURL
        
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
}

extension RemoteAPI {
    var getCharacterClassListURL: URL {
        let path = "/classes"
        return urlWithPath(path)!
    }
}
