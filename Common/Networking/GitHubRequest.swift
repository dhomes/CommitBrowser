//
//  API.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just


/// Enumerator with needed APIRequests for Application
enum GitHubRequest : APIRequest {
    
    case getCommits(_ repository : Repository, _ query : Query)
    case getFiles(_ repository : Repository, sha : String)
    
    var path: String {
        switch self {
        case .getCommits(let repository,_):
            return "/repos/\(repository.owner)/\(repository.repositoryName)/commits"
        case .getFiles(let repository, let sha):
            return "/repos/\(repository.owner)/\(repository.repositoryName)/commits/\(sha)"
        }
    }
    
    var queryParameters : [String : Any] {
        switch self {
            case .getCommits(_, let query):
                return query.parameters
            default:
                return defaultParameters
        }
    }
}
