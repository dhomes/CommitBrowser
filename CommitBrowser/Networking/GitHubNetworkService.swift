//
//  NetworkService.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just

/// NetworkService conforming type.
struct GitHubNetworkService : NetworkService {
    
    /// Get Commit-conforming collection of objects
    /// - Parameters:
    ///   - request: the API conforming object
    ///   - completion: typed result with .success [Commit]
    /// - Returns: array of Commit  (via completion block)
    func getCommits(with request : APIRequest, completion : ((Result<[Commit],Error>) -> ())?) {
        
        execute(request: request) { result in
            switch result {
            case .failure(let error):
                completion?(.failure(error))
            case .success(let json):
                let commits = json.arrayValue.compactMap { GitHubCommit(json: $0)}
                completion?(.success(commits))
            }
        }
    }
    
    /// Executes a network request to retrieve a JSON object
    /// - Parameters:
    ///   - request: the request to execute
    ///   - completion: completion object with .success -> JSON
    /// - Returns: JSON via completion block, or errors
    private func execute(request : APIRequest, completion : ((Result<JSON,Error>) -> ())?) {
    
        Just.request(request.method,
                     url: request.endpoint,
                     params: request.queryParameters,
                     headers: request.headers,
                     timeout: 5,
                     requestBody: request.requestBody,
                     asyncCompletionHandler:  { (result) in
                        
                        guard result.error == nil else {
                            completion?(.failure(result.error!))
                            return
                        }
                        
                        do {
                            guard let data = result.content else {
                                completion?(.failure(NetworkError.noContent))
                                return
                            }
                            let json = try JSON(data: data)
                            guard let code = result.statusCode, 200...299 ~= code else {
                                completion?(.failure(NetworkError.invalidCode(result.statusCode, message: json["message"].string)))
                                return
                            }
                            completion?(.success(json))
                        } catch {
                            completion?(.failure(error))
                        }
        })
    }
}
