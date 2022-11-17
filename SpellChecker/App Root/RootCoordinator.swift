//
//  RootCoordinator.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import UIKit

class RootCoordinator {
    var navigationController: UINavigationController {
        let rootNavigationController = UINavigationController(rootViewController: characterClassListViewController)
        rootNavigationController.navigationBar.prefersLargeTitles = true
        return rootNavigationController
    }
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    //MARK: - Private
    
    private var characterClassListViewController: CharacterClassListViewController {
        let api = RemoteAPI.production
        let httpClient = DefaultHTTPClient()
        let dataMapper = CharacterClassListMapper()
        
        let feature = CharacterClassListFeature(api: api, client: httpClient, mapper: dataMapper)
        let viewModel = CharacterClassListViewModel(feature: feature)
        
        return CharacterClassListViewController(viewModel: viewModel, navigationDelegate: self)
    }
}

extension RootCoordinator: CharacterClassListNavigationDelegate {
    func didSelectItem(_ item: CharacterClassListViewModel.ContentItem) {
        //
    }
}
