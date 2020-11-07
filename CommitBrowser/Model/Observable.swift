//
//  Observable.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

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
