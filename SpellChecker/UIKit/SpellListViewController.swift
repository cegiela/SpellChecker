//
//  SpellListViewController.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/17/22.
//

import UIKit

protocol SpellListNavigationDelegate: AnyObject {
    func didSelectItem(_ item: SpellListViewModel.ContentItem)
}

class SpellListViewController: UIViewController, UICollectionViewDelegate {
    
    init(viewModel: SpellListViewModel, navigationDelegate: SpellListNavigationDelegate) {
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
    
    private let viewModel: SpellListViewModel
    private weak var navigationDelegate: SpellListNavigationDelegate?
    
    private lazy var dataSource: SpellListDataSource = {
        let items = viewModel.contentItems ?? []
        return SpellListDataSource(collectionView: collectionView, items: items)
    }()
    
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private func configureView() {
        navigationItem.title = viewModel.viewTitle
        navigationItem.largeTitleDisplayMode = .automatic
        view.backgroundColor = .systemBackground

        view.addSubview(collectionView)
        collectionView.pinSelfToSuperview()
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
    
    private func observeViewModel() {
        viewModel.observeState { [weak self] state in
            self?.displayState(state)
        }
    }
    
    private func displayState(_ state: SpellListViewModel.State) {
        switch state {
        case .loading:
            break // Show spinner
        case .ready(items: let items):
            dataSource.updateItems(items: items)
        case .empty(message: let message):
            print(message)
        case .failed(message: let message):
            print(message)
        }
    }
}

fileprivate class SpellListDataSource: NSObject, UICollectionViewDataSource {
    
    private(set) var items: [SpellListViewModel.ContentItem]
    
    init(collectionView: UICollectionView, items: [SpellListViewModel.ContentItem]) {
        self.collectionView = collectionView
        self.items = items
        super.init()
        configureCollectionView()
    }
    
    func updateItems(items: [SpellListViewModel.ContentItem]) {
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

    private let cellIdentifier = "SpellListCell"
    private var collectionView: UICollectionView
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.register(BasicCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}
