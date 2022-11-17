//
//  RootCoordinator.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import UIKit

class RootCoordinator {
    lazy var navigationController: UINavigationController = {
        let rootNavigationController = UINavigationController(rootViewController: characterClassListViewController())
        rootNavigationController.navigationBar.prefersLargeTitles = true
        return rootNavigationController
    }()
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    //MARK: - Private
    
    private func characterClassListViewController() -> CharacterClassListViewController {
        let api = RemoteAPI.production
        let httpClient = DefaultHTTPClient()
        let dataMapper = CharacterClassListMapper()
        
        let feature = CharacterClassListFeature(api: api, client: httpClient, mapper: dataMapper)
        let viewModel = CharacterClassListViewModel(feature: feature)
        
        return CharacterClassListViewController(viewModel: viewModel, navigationDelegate: self)
    }
    
    private func spellListViewController(characterClass: CharacterClassListViewModel.ContentItem) -> SpellListViewController {
        let api = RemoteAPI.production
        let httpClient = DefaultHTTPClient()
        let dataMapper = SpellListMapper()
        
        let feature = SpellListFeature(api: api, client: httpClient, mapper: dataMapper)
        let viewModel = SpellListViewModel(feature: feature)
        viewModel.characterClass = characterClass
        
        return SpellListViewController(viewModel: viewModel, navigationDelegate: self)
    }
}

extension RootCoordinator: CharacterClassListNavigationDelegate {
    func didSelectItem(_ item: CharacterClassListViewModel.ContentItem) {
        var viewController = spellListViewController(characterClass: item)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension RootCoordinator: SpellListNavigationDelegate {
    func didSelectItem(_ item: SpellListViewModel.ContentItem) {
        //
    }
}
