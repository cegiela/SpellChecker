//
//  Observed.swift
//  SpellChecker
//
//  Created by Mat Cegiela on 11/16/22.
//

import Foundation

struct Observed<T> {
    private var observer: ((T) -> Void)?
    private var queue: DispatchQueue
    
    var value: T {
        didSet {
            updateObserver()
        }
    }
    
    init(_ value: T, queue: DispatchQueue = .main) {
        self.value = value
        self.queue = queue
    }
        
    mutating func observe(_ observer: @escaping (T) -> Void) {
        self.observer = observer
    }
    
    private func updateObserver() {
        queue.async {
            self.observer?(value)
        }
    }
}
