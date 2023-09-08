//
//  Observable.swift
//  PhotoViewer
//
//  Created by Maxim Startsev on 07.09.2023.
//

import Foundation

final class Observable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping (T) -> Void) {
        self.listener = listener
    }
    
}
