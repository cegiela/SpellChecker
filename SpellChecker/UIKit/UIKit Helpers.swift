//
//  UIKit Helpers.swift
//  QuickDemoOne
//
//  Created by Mat Cegiela on 11/13/22.
//

import UIKit

extension UIView {
    func pinSelfToSuperview(padding: CGFloat = 0.0) {
        guard let superview = superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: superview.leftAnchor, constant: padding),
            self.rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -padding),
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -padding)
        ])
    }
}
