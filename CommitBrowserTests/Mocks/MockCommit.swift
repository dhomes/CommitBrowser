//
//  MockCommit.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/9/20.
//

import Foundation
@testable import CommitBrowser

struct MockCommit : Commit {
    var authorName: String = "David Homes"
    
    var email: String = "dhomes@gmail.com"
     
    var hash: String = UUID().uuidString
    
    var message: String = "Just testing"
    
    var authorImageUrl: URL? = nil
    
    var date: Date = Date()
    
    var url: URL = URL(string: "https://api.github.com/repos/dhomes/CommitBrowser/commits/d95b785bc4dcd5c8b8b9154b5a97beadf5edd3b9")!
    
    
}
