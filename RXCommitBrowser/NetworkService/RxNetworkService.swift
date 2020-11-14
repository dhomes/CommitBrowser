//
//  RxNetworkService.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import Foundation
import Combine
import Just

class RxNetworkService {
    private var cancellable = Set<AnyCancellable>()
    
    func commits(request : APIRequest) -> Future<[Commit],Error>{
    
        Future<[Commit],Error> { promise in
            self.execute(request: request).sink { result in
                switch result {
                case .failure(let error):
                    promise(Result.failure(error))
                case .finished:
                    break
                }
            } receiveValue: { json in
                let commits = json.arrayValue.compactMap { GitHubCommit.init(json: $0) }
                promise(Result.success(commits.sorted(by: { $0.date > $1.date })))
            }.store(in: &self.cancellable)
        }
    }
}

private extension RxNetworkService {
    /// Executes a network request to retrieve a JSON object
    /// - Parameters:
    ///   - request: the request to execute
    ///   - completion: completion object with .success -> JSON
    /// - Returns: JSON via completion block, or errors
    func execute(request : APIRequest) -> Future<JSON,Error> {
        
        return Future<JSON,Error> { promise in
            Just.request(request.method,
                         url: request.endpoint,
                         params: request.queryParameters,
                         headers: request.headers,
                         timeout: 5,
                         requestBody: request.requestBody,
                         asyncCompletionHandler:  { (result) in
                            print(request.queryParameters)
                            guard result.error == nil else {
                                promise(Result.failure(result.error!))
                                return
                            }
                            
                            do {
                                guard let data = result.content else {
                                    promise(Result.failure(NetworkError.noContent))
                                    return
                                }
                                let json = try JSON(data: data)
                                print(json)
                                guard let code = result.statusCode, 200...299 ~= code else {
                                    promise(Result.failure(NetworkError.invalidCode(result.statusCode, message: json["message"].string)))
                                    return
                                }
                                promise(Result.success(json))
                            } catch {
                                promise(Result.failure(error))
                            }
            })
        } 
    }
}
