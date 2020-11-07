//
//  API.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just

protocol APIRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method : HTTPMethod { get }
    var defaultHeaders : [String : String] { get }
    var headers : [String : String] { get }
    var endpoint : URL { get }
    var requestBody : Data? { get }
}

extension APIRequest {
    var baseURL : URL {
        guard let url = URL(string: "https://api.github.com") else {
            fatalError("Error in base URL")
        }
        return url
    }
    var defaultHeaders : [String : String] {
         ["Content-Type" : "application/json"]
    }
    var endpoint : URL {
        baseURL.appendingPathComponent(path)
    }
    var requestBody : Data? {
        nil
    }
}
