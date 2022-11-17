//
//  SpellDetailsViewModel.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class SpellDetailsViewModel {
    
    struct ContentItem {
        let name: String
        let identifier: String
        let description: String
    }
    
    enum State {
        case loading
        case ready(item: ContentItem)
        case empty(message: String)
        case failed(message: String)
    }
    
    var viewTitle: String {
        if let spellName = spellListItem?.name {
            return "\(spellName)"
        } else {
            return "Spell"
        }
    }
    
    private(set) var state: Observed<State>
    
    var spellListItem: SpellListViewModel.ContentItem? {
        didSet {
            if let identifier = spellListItem?.identifier {
                loadDetails(spellIdentifier: identifier)
            } else {
                state.value = .empty(message: "Nothing to show yet")
            }
        }
    }
    
    init(feature: SpellDetailsFeature) {
        self.feature = feature
        self.state = Observed(State.loading)
    }
    
    var spell: ContentItem? {
        if case .ready(let item) = state.value {
            return item
        } else {
            return nil
        }
    }
    
    func observeState(observer: @escaping (State) -> Void) {
        state.observe(observer)
    }
    
    //MARK: - Private
    
    private let feature: SpellDetailsFeature
    
    private func loadDetails(spellIdentifier: String) {
        feature.loadSpell(spellIdentifier: spellIdentifier) { [weak self] result in
            
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.updateWithError(error)
                case .success(let spell):
                    self?.updateWithItem(spell)
                }
            }
        }
    }
    
    private func updateWithError(_ error: SpellDetailsFeature.LoadError) {
        state.value = .failed(message: "Something went wrong, content failed to load")
    }
    
    private func updateWithItem(_ item: Spell) {
        state.value = .ready(item: mapContentForSpell(item))
    }
    
    private func mapContentForSpell(_ spell: Spell) -> ContentItem {
        let description = spell.descriptions.joined(separator: "\n\n")
        return ContentItem(name: spell.name, identifier: spell.index, description: description)
    }
}
