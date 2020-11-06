//
//  CommitData.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol CommitData : Equatable, Decodable, CustomStringConvertible {
    
    associatedtype UserSummary
    associatedtype Tree
    associatedtype Verification
    
    var author : UserSummary { get }
    var committer : UserSummary { get }
    var message : String { get }
    var tree : Tree { get }
    var url : URL { get }
    var commentCount : Int { get }
    var verification : Verification { get }
}

extension CommitData {
    static func == (lhs : Self, rhs : Self) -> Bool {
        lhs.url.absoluteString == rhs.url.absoluteString
    }
}

extension CommitData {
    var description : String {
        """
        CommitData:
         Author:
            \(author)
         Committer:
            \(committer)
         Message:
            \(message)
         Url:
            \(url.absoluteString)
         CommentCount: \(commentCount)
         Verification :
            \(verification)
        """
    }
}

