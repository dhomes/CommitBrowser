//
//  MockCommit.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/9/20.
//

import Foundation


struct MockCommit : Commit {
     
    
    var authorName: String = "David Homes"
    
    var email: String = "dhomes@gmail.com"
     
    var hash: String = UUID().uuidString
    
    var message: String = "Just testing a faily large commit message for ui layout purposes, this is just a mock message not to be payed attention to"
    
    var authorImageUrl: URL? = URL(string: "https://avatars2.githubusercontent.com/u/152622?v=4")
    
    var date: Date = Date()
    
    var url: URL = URL(string: "https://api.github.com/repos/dhomes/CommitBrowser/commits/d95b785bc4dcd5c8b8b9154b5a97beadf5edd3b9")!
    
    
}
