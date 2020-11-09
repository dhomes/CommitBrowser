//
//  Commit.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation


/// Commit protocol representing the needed Commit info for the app-domain
protocol Commit : CustomStringConvertible {
    var authorName : String { get }
    var email : String { get }
    var hash : String { get }
    var message : String { get }
    var authorImageUrl : URL? { get }
    var date : Date { get }
    var url : URL { get }
}

extension Commit {
    var description: String {
        """
        COMMIT -------
        hash : \(hash)
        date: \(date.description(with: Locale.current))
        message : \(message)
        url : \(url.absoluteString)
        authorName : \(authorName)
        email : \(email)
        authorImageUrl : \(authorImageUrl?.absoluteString ?? "nil")
        """
    }
}


