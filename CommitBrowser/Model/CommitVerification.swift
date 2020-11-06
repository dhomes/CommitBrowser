//
//  GitHubCommitTree.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct CommitVerification : Verification {
    private(set) var verified: Bool
    private(set) var reason: String
    private(set) var signature: String?
    private(set) var payload: String?
}
