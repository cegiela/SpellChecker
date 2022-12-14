//
//  RemoteAPI.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

enum RemoteAPI {
    case production
    
    func urlWithPath(_ path: String) -> URL? {
        var url = URL(string: baseURL)
        url?.appendPathComponent(path)
        return url
    }
    
    //MARK: - Private
    
    private var baseURL: String {
        "https://www.dnd5eapi.co/api"
    }
}
