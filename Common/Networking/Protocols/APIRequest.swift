//
//  API.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just


/// Protocol for all API Request that may be needed
protocol APIRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method : HTTPMethod { get }
    var headers : [String : String] { get }
    var endpoint : URL { get }
    var requestBody : Data? { get }
    var defaultParameters : [String : Any] { get }
    var queryParameters : [String : Any] { get }
}

extension APIRequest {
    var baseURL : URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("Error in base URL")
        }
        return url
    }
    var headers : [String : String] {
         ["Content-Type" : "application/json"]
    }
    var endpoint : URL {
        baseURL.appendingPathComponent(path)
    }
    var requestBody : Data? {
        nil
    }
    var defaultParameters : [String : Any] {
        [String : Any]()
    }
    var method : HTTPMethod {
        return .get
    }
    var path : String {
        ""
    }
}
