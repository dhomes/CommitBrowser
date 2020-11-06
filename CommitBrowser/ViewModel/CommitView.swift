//
//  CommitViewModel.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct CommitView {
    
    typealias Commit = GitHubCommit
    private(set) var authorName: String
    private(set) var authorEmail: String
    private(set) var authorAvatarUrl: URL?
    private(set) var commitHash: String
    private(set) var commitMessage: String
    private(set) var commitDate : Date
    
    init(_ commit : Commit) {
        authorName = commit.commitData.author.name
        authorEmail = commit.commitData.author.email
        authorAvatarUrl = commit.author.avatarUrl
        commitHash = commit.sha
        commitMessage = commit.commitData.message
        commitDate = commit.commitData.committer.date
    }
    
    
}

extension CommitView {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.commitHash == rhs.commitHash
    }
}
