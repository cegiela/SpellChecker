//
//  SpellDetailsViewModelAdapter.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/17/22.
//

import Foundation

class SpellDetailsViewModelAdapter: ObservableObject {
    @Published var spellItem: SpellDetailsViewModel.ContentItem?

    var viewModel: SpellDetailsViewModel?
    
    init(viewModel: SpellDetailsViewModel?) {
        self.viewModel = viewModel
        configureObservable()
    }
    
    private func configureObservable() {
        spellItem = viewModel?.spell
        viewModel?.observeState(observer: { [weak self] state in
            self?.updateState(state)
        })
    }
    
    private func updateState(_ state: SpellDetailsViewModel.State) {
        switch state {
        case .loading:
            break // show spinner
        case .ready(item: let item):
            spellItem = item
        case .empty(message: let message):
            print(message)
            spellItem = nil
        case .failed(message: let message):
            print(message)
            spellItem = nil
        }
    }
}

extension SpellDetailsViewModelAdapter {
    static func example() -> SpellDetailsViewModelAdapter {
        let example = SpellDetailsViewModelAdapter(viewModel: nil)
        let mockSpell = MockSpell().spell
        example.spellItem = mapContentForSpell(mockSpell)
        return example
    }
    
    static func mapContentForSpell(_ spell: Spell) -> SpellDetailsViewModel.ContentItem {
        let description = spell.descriptions.joined(separator: "\n\n")
        let components = spell.components.joined(separator: ", ")
        let ritual = spell.ritual ? "Yes" : "No"
        let concentration = spell.concentration ? "Yes" : "No"
        
        return SpellDetailsViewModel.ContentItem(
            name: spell.name,
            identifier: spell.index,
            description: description,
            range: spell.range,
            components: components,
            duration: spell.duration,
            castingTime: spell.castingTime,
            school: spell.school.name,
            level: String(spell.level),
            ritual: ritual,
            concentration: concentration,
            attackType: nil,
            damageType: nil,
            damageAtCharacterLevel: nil)
    }
}
