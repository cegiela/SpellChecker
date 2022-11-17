//
//  SpellDetailsView.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/17/22.
//

import SwiftUI

struct SpellDetailsView: View {
    @ObservedObject var adapter: SpellDetailsViewModelAdapter
    
    var body: some View {
        Text(adapter.spell?.name ?? "")
    }
}

struct SpellDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let example = SpellDetailsViewModelAdapter.example()
        SpellDetailsView(adapter: example)
    }
}

class SpellDetailsViewModelAdapter: ObservableObject {
    @Published var spell: SpellDetailsViewModel.ContentItem?

    var viewModel: SpellDetailsViewModel?
    
    init(viewModel: SpellDetailsViewModel?) {
        self.viewModel = viewModel
        configureObservable()
    }
    
    private func configureObservable() {
        spell = viewModel?.spell
        viewModel?.observeState(observer: { [weak self] state in
            self?.updateState(state)
        })
    }
    
    private func updateState(_ state: SpellDetailsViewModel.State) {
        switch state {
        case .loading:
            break // show spinner
        case .ready(item: let item):
            spell = item
        case .empty(message: let message):
            print(message)
            spell = nil
        case .failed(message: let message):
            print(message)
            spell = nil
        }
    }
    
    static func example() -> SpellDetailsViewModelAdapter {
        SpellDetailsViewModelAdapter(viewModel: nil)
    }
}
