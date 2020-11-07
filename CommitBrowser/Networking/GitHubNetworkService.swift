//
//  NetworkService.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
import Just

struct GitHubNetworkService : NetworkService {
    typealias Commit = GitHubCommit
    
    func getCommits(with request : APIRequest, completion : ((Result<[Commit],Error>) -> ())?) {
        Just.request(request.method,
                     url: request.endpoint,
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
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .iso8601
                            let responseObject = try decoder.decode([Commit].self, from: data)
                            completion?(.success(responseObject))
                        } catch {
                            completion?(.failure(error))
                        }
                })
    }
}
