//
//  GitHubCommitData.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct CommitDataSummary : CommitData {
    
    typealias UserSummary = CommitUserSummary
    typealias Tree = CommitTree
    typealias Verification = CommitVerification
    
    var author: UserSummary
    var committer: UserSummary
    var message: String
    var tree: Tree
    var url: URL
    var commentCount: Int
    var verification: Verification
    
    
    private enum CodingKeys : String, CodingKey {
        case author
        case committer
        case tree
        case url
        case message
        case commentCount = "comment_count"
        case verification
    }
    
}
