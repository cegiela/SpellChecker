//
//  CharacterClassListMapper.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct CharacterClassListMapper {
    private struct Container: Codable {
        let results: [CharacterClassListItem]
    }
    
    func map(data: Data) throws -> [CharacterClassListItem] {
        let container = try JSONDecoder().decode(Container.self, from: data)
        return container.results
    }
}
