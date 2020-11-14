//
//  File.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

/// Protocol for Networking object
protocol NetworkService {
    func getCommits(with request : APIRequest, completion : ((Result<[Commit],Error>) -> ())?)
    func getFiles(for commit : Commit, completion : ((Result<[File],Error>) -> ())?)
}

