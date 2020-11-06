//
//  User.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol User : Equatable, Decodable, CustomStringConvertible {
    var login : String { get }
    var id : Int { get }
    var nodeId : String { get }
    var avatarUrl : URL? { get }
    var url : URL { get }
    var htmlUrl : URL { get }
    var reposUrl : URL { get }
    var type : String { get }
    var isSiteAdmin : Bool { get }
}

extension User {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

extension User {
    var description : String {
        """
        USER
        login: (\(login))
        id: \(id)
        nodeId: \(nodeId)
        avatarUrl: \(avatarUrl?.absoluteString ?? "nil")
        url: \(url.absoluteString)
        htmlUrl: \(htmlUrl.absoluteString)
        reposUrl: \(reposUrl.absoluteString)
        user type: \(type)
        isSiteAdmin: \(isSiteAdmin)
        """
    }
}

