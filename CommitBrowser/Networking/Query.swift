//
//  Query.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

struct Query {
    var pageSize : Int?
    var below : Date?
    static var defaultQuery : Query {
        Query(pageSize: 25, below: nil)
    }
    var parameters : [String : Any] {
        var params = [String : Any]()
        if let pageSize = pageSize {
            params["per_page"] = pageSize
        }
        if let date = below {
            let formatter = ISO8601DateFormatter()
            let dateString = formatter.string(from: date)
            params["until"] = dateString
        }
        return params
    }
}

