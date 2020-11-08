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

    var path: String {
        switch self {
        case .getCommits(let repository,_):
            return "/repos/\(repository.owner)/\(repository.repositoryName)/commits"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getCommits(_,_):
                return .get
        }
    }
    
    var queryParameters : [String : Any] {
        switch self {
            case .getCommits(_, let query):
                return query.parameters
        }
    }
}
