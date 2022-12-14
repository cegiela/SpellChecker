//
//  CharacterClassListViewController.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import UIKit

protocol CharacterClassListNavigationDelegate: AnyObject {
    func didSelectItem(_ item: CharacterClassListViewModel.ContentItem)
}

class CharacterClassListViewController: UIViewController, UICollectionViewDelegate {

    init(viewModel: CharacterClassListViewModel, navigationDelegate: CharacterClassListNavigationDelegate) {
        self.viewModel = viewModel
        self.navigationDelegate = navigationDelegate
        super.init(nibName: nil, bundle: nil)
        
        configureView()
        observeViewModel()
        displayState(viewModel.state.value)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = dataSource.items[indexPath.item]
        navigationDelegate?.didSelectItem(item)
    }
    
    //MARK: - Private
    
    private let viewModel: CharacterClassListViewModel
    private weak var navigationDelegate: CharacterClassListNavigationDelegate?
    
    private lazy var dataSource: CharacterClassListDataSource = {
        let items = viewModel.contentItems ?? []
        return CharacterClassListDataSource(collectionView: collectionView, items: items)
    }()
    
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private var statusLabel = UILabel()
    
    private func configureView() {
        navigationItem.title = viewModel.viewTitle
        navigationItem.largeTitleDisplayMode = .automatic
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        collectionView.pinSelfToSuperview()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        
        view.addSubview(statusLabel)
        statusLabel.pinSelfToSuperview()
        statusLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        statusLabel.textAlignment = .center
        statusLabel.backgroundColor = .systemBackground
        statusLabel.isHidden = true
    }
    
    private func observeViewModel() {
        viewModel.observeState { [weak self] state in
            self?.displayState(state)
        }
    }
    
    private func displayState(_ state: CharacterClassListViewModel.State) {
        statusLabel.isHidden = false

        switch state {
        case .loading:
            statusLabel.text = "Loading..."
            break // Show spinner
        case .ready(items: let items):
            dataSource.updateItems(items: items)
            statusLabel.isHidden = true
            break
        case .empty(message: let message):
            statusLabel.text = message
            break
        case .failed(message: let message):
            statusLabel.text = message
        }
    }
}

fileprivate class CharacterClassListDataSource: NSObject, UICollectionViewDataSource {
    
    private(set) var items: [CharacterClassListViewModel.ContentItem]
    
    init(collectionView: UICollectionView, items: [CharacterClassListViewModel.ContentItem]) {
        self.collectionView = collectionView
        self.items = items
        super.init()
        configureCollectionView()
    }
    
    func updateItems(items: [CharacterClassListViewModel.ContentItem]) {
        self.items = items
        collectionView.reloadData()
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! BasicCell
        cell.showContent(text: item.name)
        return cell
    }
    
    //MARK: - Private

    private let cellIdentifier = "CharacterClassListCell"
    private var collectionView: UICollectionView
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.register(BasicCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}
