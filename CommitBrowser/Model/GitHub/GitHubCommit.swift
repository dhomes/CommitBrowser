//
//  GitHubCommit.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

/// Commit conforming type
struct GitHubCommit : Commit {

    private(set) var authorName: String
    private(set) var email: String
    private(set) var hash: String
    private(set) var message: String
    private(set) var authorImageUrl: URL?
    private(set) var date: Date
    private(set) var url : URL
    private(set) var files : [File]?
    
    /// JSON parsing keys
    private struct Keys {
        static let sha = "sha"
        static let commit = "commit"
        static let author = "author"
        static let name = "name"
        static let email = "email"
        static let message = "message"
        static let date = "date"
        static let avatarUrl = "avatar_url"
        static let url = "url"
    }
    
    /// Failable initializer from JSON
    /// - Parameter json: single commit JSON
    init?(json : JSON) {
        let commit = json[Keys.commit]
        let author = commit[Keys.author]
        guard let sha = json[Keys.sha].string else { return nil }
        guard let name = author[Keys.name].string else { return nil }
        guard let email = author[Keys.email].string else { return nil }
        guard let message = commit[Keys.message].string else { return nil }
        guard let url = URL(string: json["url"].stringValue) else { return nil }
        let dateString = author[Keys.date].stringValue
        let formatter = ISO8601DateFormatter()
        guard let date = formatter.date(from: dateString) else { return nil }
        
        let avatar = json[Keys.author][Keys.avatarUrl].stringValue
        let avatarUrl : URL? = URL(string: avatar)
        self.authorName = name
        self.hash = sha
        self.email = email
        self.authorImageUrl = avatarUrl
        self.date = date
        self.message = message
        self.url = url
    }
    
    mutating func setFiles(_ files : [File]) {
        self.files = files
    }
}

