//
//  CharacterClassListViewModel.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

class CharacterClassListViewModel {
    
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
    
    let viewTitle = "D&D Character Classes"
    private(set) var state: Observed<State>

    init(feature: CharacterClassListFeature) {
        self.feature = feature
        self.state = Observed(State.loading)
        
        loadList()
    }
    
    //MARK: - Private
    
    private let feature: CharacterClassListFeature
    
    private func loadList() {
        feature.loadList { [weak self] result in
            
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
    
    private func updateWithError(_ error: CharacterClassListFeature.LoadError) {
        state.value = .failed(message: "Something went wrong, content failed to load")
    }
    
    private func updateWithItems(_ items: [CharacterClassListItem]) {
        if items.isEmpty {
            state.value = .empty(message: "There is no content available right now")
        } else {
            let contentItems = items.map { ContentItem(name: $0.name, identifier: $0.index)}
            state.value = .ready(items: contentItems)
        }
    }
}
