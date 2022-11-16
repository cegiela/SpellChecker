//
//  RootCoordinator.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import UIKit

class RootCoordinator {
    var navigationController: UINavigationController {
        let characterClassListViewController = CharacterClassListViewController()
        let rootNavigationController = UINavigationController(rootViewController: characterClassListViewController)
        rootNavigationController.navigationBar.prefersLargeTitles = true
        return rootNavigationController
    }
    
    var rootViewController: UIViewController {
        return navigationController
    }
}
