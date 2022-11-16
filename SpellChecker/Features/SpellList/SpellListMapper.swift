//
//  SpellListMapper.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct SpellListMapper {
    
    func map(data: Data) throws -> [SpellListItem] {
        let container = try JSONDecoder().decode(Container.self, from: data)
        return container.results
    }
    
    //MARK: - Private

    private struct Container: Codable {
        let results: [SpellListItem]
    }
}
