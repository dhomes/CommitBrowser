//
//  Commit.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol Commit : Decodable, Equatable, CustomStringConvertible  {
    associatedtype User
    associatedtype CommitData
    
    var sha : String { get }
    var nodeId : String { get}
    var url : URL { get }
    var htmlUrl : URL { get }
    var commentsUrl : URL { get }
    var commitData : CommitData { get }
    var author : User { get }
    var committer : User { get }
     
}

extension Commit {
    static func ==(lhs : Self, rhs : Self) -> Bool {
        lhs.sha == rhs.sha
    }
}

extension Commit {
    var description: String {
        """
        Commit:
         sha: \(sha)
         nodeId: \(nodeId)
         url: \(url.absoluteString)
         htmlUrl: \(htmlUrl.absoluteString)
         commentsUrl: \(commentsUrl.absoluteString)

         commitData:
         -----------------
            \(commitData)
         author:
         -----------------
            \(author)
         commiter:
         -----------------
            \(committer)
        """
    }
}

