//
//  Observable.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

/// Observable pattern. Use to avoid RxSwift or other reactive frameworks (for simplicity)
class Observable<T> {
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    init(_ value : T) {
        self.value = value
    }
    
    var valueChanged: ((T) -> Void)? = nil
}
