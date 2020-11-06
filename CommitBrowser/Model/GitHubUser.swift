//
//  GitHubUser.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation


struct GitHubUser : User {
    
    private(set) var login: String
    private(set) var id: Int
    private(set) var nodeId: String
    private(set) var avatarUrl: URL?
    private(set) var url: URL
    private(set) var htmlUrl: URL
    private(set) var reposUrl: URL
    private(set) var type: String
    private(set) var isSiteAdmin: Bool
    
    private enum CodingKeys : String, CodingKey {
        case login
        case id
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case url
        case htmlUrl = "html_url"
        case reposUrl = "repos_url"
        case type
        case isSiteAdmin = "site_admin"
    }
    
}
