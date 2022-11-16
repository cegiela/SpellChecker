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
    
    private(set) var state: Observed<State>
    
    var characterClassItem: CharacterClassListViewModel.ContentItem? {
        didSet {
            if let identifier = characterClassItem?.identifier {
                loadList(characterClassIdentifier: identifier)
            } else {
                state.value = .empty(message: "Nothing to show yet")
            }
        }
    }
    
    init(feature: SpellListFeature) {
        self.feature = feature
        self.state = Observed(State.loading)
    }
    
    //MARK: - Private
    
    private let feature: SpellListFeature
    
    private func loadList(characterClassIdentifier: String) {
        feature.loadList(characterClassIdentifier: characterClassIdentifier) { [weak self] result in
            
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
        state.value = .failed(message: "Something went wrong, content failed to load")
    }
    
    private func updateWithItems(_ items: [SpellListItem]) {
        if items.isEmpty {
            state.value = .empty(message: "There is no content available right now")
        } else {
            let contentItems = items.map { ContentItem(name: $0.name, identifier: $0.index)}
            state.value = .ready(items: contentItems)
        }
    }
}
