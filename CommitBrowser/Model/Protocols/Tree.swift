//
//  Tree.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol Tree : Equatable, Decodable, CustomStringConvertible {
    var sha : String { get }
    var url : URL { get }
}

extension Tree {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.sha == rhs.sha
    }
}

extension Tree {
    var description: String {
        """
        Tree
         sha: \(sha)
         url: \(url.absoluteString)
        """
    }
}
