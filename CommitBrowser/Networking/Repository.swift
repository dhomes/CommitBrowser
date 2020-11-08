//
//  Repository.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

/// Repository type. Needed by APIRequest
struct Repository {
    var owner : String
    var repositoryName : String
    static var defaultRepository : Repository {
        Repository(owner: "dhomes", repositoryName: "commitbrowser")
    }
}
