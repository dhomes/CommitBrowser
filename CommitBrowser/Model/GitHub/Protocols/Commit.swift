//
//  Commit.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

protocol Commit : CustomStringConvertible {
    var authorName : String { get }
    var email : String { get }
    var hash : String { get }
    var message : String { get }
    var authorImageUrl : URL? { get }
    var date : Date { get }
}

extension Commit {
    var description: String {
        """
        COMMIT -------
        hash : \(hash)
        date: \(date.description(with: Locale.current))
        message : \(message)
        authorName : \(authorName)
        email : \(email)
        authorImageUrl : \(authorImageUrl?.absoluteString ?? "nil")
        """
    }
}

