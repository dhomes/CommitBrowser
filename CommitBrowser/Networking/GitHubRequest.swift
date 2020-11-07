//
//  API.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just

enum GitHubRequest : APIRequest {
    
    case getCommits(_ owner : String, _ repositoryName : String, _ pagesize : Int)

    var path: String {
        switch self {
        case .getCommits(let owner, let repository, _):
            return "/repos/\(owner)/\(repository)/commits"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getCommits(_,_,_):
                return .get
        }
    }

    var headers: [String : String] {
        switch self {
        case .getCommits(_, _, let pageSize):
            var headers = defaultHeaders
            headers["per_page"] = "\(pageSize)"
            return headers
        }
    }
}
