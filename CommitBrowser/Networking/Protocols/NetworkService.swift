//
//  File.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol NetworkService {
    associatedtype Commit
    func getCommits(with request : APIRequest, completion : ((Result<[Commit],Error>) -> ())?)
}

