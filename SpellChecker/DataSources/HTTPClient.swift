//
//  HTTPClient.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

enum HTTPResponseError: Error {
    case responseCode(statusCode: Int)
    case responseUndefined(error: Error?)
    case unreachable
}

protocol HTTPClient {
    func getRequest(url: URL, completion: @escaping (Result<Data, HTTPResponseError>) -> Void)
}

protocol NetworkConnectivity {
    var isConnected: Bool { get }
}
