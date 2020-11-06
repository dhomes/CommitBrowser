//
//  GitHubCommit.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct GitHubCommit : Commit {

    typealias User = CommitUser
    typealias CommitData = CommitDataSummary
    
    private(set) var sha: String
    private(set) var nodeId: String
    private(set) var url: URL
    private(set) var htmlUrl: URL
    private(set) var commentsUrl: URL
    private(set) var commitData: CommitData
    private(set) var author: User
    private(set) var committer: User
    
    private enum CodingKeys : String, CodingKey {
        case sha
        case nodeId = "node_id"
        case url
        case htmlUrl = "html_url"
        case commentsUrl = "comments_url"
        case commitData = "commit"
        case author
        case committer
    }
}
