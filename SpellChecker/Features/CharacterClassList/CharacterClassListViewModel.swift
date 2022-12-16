//
//  CharacterClassListViewModel.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

protocol CharacterClassListModel {
    typealias LoadResult = Result<[CharacterClassListItem], CharacterClassListFeature.LoadError>
    
    func loadList(completion: @escaping (LoadResult) -> Void)
}

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
    
    private(set) var state: Observed<State>
    
    var contentItems: [ContentItem]? {
        if case .ready(let items) = state.value {
            return items
        }
        return nil
    }
    
    let viewTitle = "D&D Classes"
    
    init(model: CharacterClassListModel) {
        self.model = model
        self.state = Observed(State.loading)
        
        loadList()
    }
    
    func observeState(observer: @escaping (State) -> Void) {
        state.observe(observer)
    }
    
    //MARK: - Private
    
    private let model: CharacterClassListModel
    
    private func loadList() {
        model.loadList { [weak self] result in
            
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
        state.value = .failed(message: defaultContentErrorMessage)
    }
    
    private func updateWithItems(_ items: [CharacterClassListItem]) {
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
