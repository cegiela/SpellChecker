//
//  SpellListViewModel.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class SpellListViewModel {
    
    struct ContentItem {
        let name: String
        let identifier: String
    }
    
    enum State {
        case loading
        case ready(items: [ContentItem])
        case empty(message: String)
        case failed(message: String)
    }
    
    var viewTitle: String {
        if let className = characterClassItem?.name {
            return "\(className) Spells"
        } else {
            return "Spell List"
        }
    }
    
    private(set) var state: State
    
    var characterClassItem: CharacterClassListItem? {
        didSet {
            if let identifier = characterClassItem?.index {
                loadList(characterClass: identifier)
            } else {
                state = .empty(message: "Nothing to show yet")
            }
        }
    }
    
    init(feature: SpellListFeature) {
        self.feature = feature
        self.state = .loading
    }
    
    //MARK: - Private
    
    private let feature: SpellListFeature
    
    private func loadList(characterClass: String) {
        feature.loadList(characterClass: characterClass) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.updateWithError(error)
                case .success(let items):
                    self?.updateWithItems(items)
                }
            }
        }
    }
    
    private func updateWithError(_ error: SpellListFeature.LoadError) {
        state = .failed(message: "Something went wrong, content failed to load")
    }
    
    private func updateWithItems(_ items: [SpellListItem]) {
        if items.isEmpty {
            state = .empty(message: "There is no content available right now")
        } else {
            let contentItems = items.map { ContentItem(name: $0.name, identifier: $0.index)}
            state = .ready(items: contentItems)
        }
    }
}
