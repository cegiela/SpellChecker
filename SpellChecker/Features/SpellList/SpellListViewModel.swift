//
//  SpellListViewModel.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

protocol SpellListModel {
    typealias LoadResult = Result<[SpellListItem], SpellListFeature.LoadError>

    func loadList(characterClassIdentifier: String, completion: @escaping (LoadResult) -> Void)
}

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
        
    private(set) var state: Observed<State>

    var contentItems: [ContentItem]? {
        if case .ready(let items) = state.value {
            return items
        }
        return nil
    }
    
    var viewTitle: String {
        if let className = characterClass?.name {
            return "\(className) Spells"
        } else {
            return "Spell List"
        }
    }
    
    var characterClass: CharacterClassListViewModel.ContentItem? {
        didSet {
            if let identifier = characterClass?.identifier {
                loadList(characterClassIdentifier: identifier)
            } else {
                state.value = .empty(message: defaultContentEmptyMessage)
            }
        }
    }
    
    init(model: SpellListModel) {
        self.model = model
        self.state = Observed(State.loading)
    }
    
    func observeState(observer: @escaping (State) -> Void) {
        state.observe(observer)
    }
    
    //MARK: - Private
    
    private let model: SpellListModel
    
    private func loadList(characterClassIdentifier: String) {
        model.loadList(characterClassIdentifier: characterClassIdentifier) { [weak self] result in
            
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
        state.value = .failed(message: defaultContentErrorMessage)
    }
    
    private func updateWithItems(_ items: [SpellListItem]) {
        if items.isEmpty {
            state.value = .empty(message: defaultContentEmptyMessage)
        } else {
            let contentItems = items.map { ContentItem(name: $0.name, identifier: $0.index)}
            state.value = .ready(items: contentItems)
        }
    }
    
    private var defaultContentEmptyMessage = "There is no content available here"
    private var defaultContentErrorMessage = "Something went wrong, content failed to load"
}
