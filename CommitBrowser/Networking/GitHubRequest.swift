//
//  API.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just
 

enum GitHubRequest : APIRequest {
    
    case getCommits(_ owner : String, _ repositoryName : String, _ pagesize : Int, _ below : Date?)

    var path: String {
        switch self {
        case .getCommits(let owner, let repository, _, _):
            return "/repos/\(owner)/\(repository)/commits"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getCommits(_,_,_,_):
                return .get
        }
    }

    var headers: [String : String] {
        switch self {
        case .getCommits(_, _, let pageSize, let below):
            var headers = defaultHeaders
            headers["per_page"] = "\(pageSize)"
            if let date = below {
                let formatter = ISO8601DateFormatter()
                let dateString = formatter.string(from: date)
                headers["until"] = dateString
            }
            return headers
        }
    }
}
