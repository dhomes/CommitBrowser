//
//  GitHubFile.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import Foundation

struct GitHubFile : File {
    
    var sha: String
    var filename: String
    var status: String
    var additions: Int
    var deletions: Int
    var changes: Int
    var blobUrl: URL
    var rawUrl: URL
    var contentsUrl: URL
    var patch: String? = nil
    
    // File specific keys
    private struct Keys {
        static let sha = "sha"
        static let filename = "filename"
        static let status = "status"
        static let additions = "additions"
        static let deletions = "deletions"
        static let changes = "changes"
        static let blobUrl = "blob_url"
        static let rawUrl = "raw_url"
        static let contents_url = "contents_url"
        static let patch = "patch"
    }
    
    /// Failable initializer from JSON
    /// - Parameter json: commitUrl response
    init?(json : JSON) {
            guard let sha = json[Keys.sha].string else { return nil }
            guard let filename = json[Keys.filename].string else { return nil }
            guard let status = json[Keys.status].string else { return nil }
            guard let additions = json[Keys.additions].int else { return nil }
            guard let deletions = json[Keys.deletions].int else { return nil }
            guard let changes = json[Keys.changes].int else { return nil }
            guard let blobUrl = URL(string: json[Keys.blobUrl].stringValue) else { return nil }
            guard let rawUrl = URL(string: json[Keys.rawUrl].stringValue) else { return nil }
            guard let contentsUrl = URL(string: json[Keys.contents_url].stringValue) else { return nil }
            let patch = json[Keys.patch].string
            self.sha = sha
            self.filename = filename
            self.status = status
            self.additions = additions
            self.deletions = deletions
            self.changes = changes
            self.blobUrl = blobUrl
            self.rawUrl = rawUrl
            self.contentsUrl = contentsUrl
            self.patch = patch
    }
}
