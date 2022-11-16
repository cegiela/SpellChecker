//
//  DefaultHTTPClient.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class DefaultHTTPClient: HTTPClient {
    private let session: URLSession
    private static let okStatusRange = 200...299
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func getRequest(url: URL, completion: @escaping (Result<Data, HTTPResponseError>) -> Void) {
        
        let task = session.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let response = response as? HTTPURLResponse {
                if !DefaultHTTPClient.okStatusRange.contains(response.statusCode) {
                    completion(.failure(.responseCode(statusCode: response.statusCode)))
                }
            } else if let error {
                completion(.failure(.responseUndefined(error: error)))
            } else if let data {
                completion(.success(data))
            } else {
                completion(.failure(.responseUndefined(error: nil)))
            }
        }
        task.resume()
    }
}
