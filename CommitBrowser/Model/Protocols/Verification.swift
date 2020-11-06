//
//  Verification.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol Verification : Decodable, CustomStringConvertible {
    var verified : Bool { get }
    var reason : String { get }
    var signature : String? { get }
    var payload : String? { get }
}

extension Verification {
    var description : String {
        """
        Verification:
         verified: \(verified)
         reason: \(reason)
         signature: \(signature ?? "nil")
         payload: \(payload ?? "nil")
        """
    }
}
