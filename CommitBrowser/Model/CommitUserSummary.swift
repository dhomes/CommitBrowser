//
//  GitHubUserSummary.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct CommitUserSummary : UserSummary {
    private(set) var name: String
    private(set) var date: Date
    private(set) var email: String
}
