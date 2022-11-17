//
//  BasicCell.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/17/22.
//

import UIKit

class BasicCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showContent(text: String) {
        mainLabel.text = text
    }
    
    //MARK: - Private
    
    private let mainLabel = UILabel()

    private func configureSubviews() {
        mainLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        contentView.addSubview(mainLabel)
        mainLabel.pinSelfToSuperview(padding: 20.0)
    }
}
