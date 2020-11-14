//
//  MockNetworkService.swift
//  CommitBrowserTests
//
//  Created by dhomes on 11/8/20.
//

import Foundation


class MockNetworkService : NetworkService {
    func getFiles(for commit: Commit, completion: ((Result<[File], Error>) -> ())?) {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "Files", withExtension: "json") else {
            completion?(.failure(NetworkError.other(message: "Could not parse Files json file")))
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            let files = json.arrayValue.compactMap { GitHubFile(json: $0) }
            completion?(.success(files))
        } catch {
            completion?(.failure(error))
        }
    }
    
    
    func getCommits(with request: APIRequest, completion: ((Result<[Commit], Error>) -> ())?) {
        guard let url = Bundle.init(for: type(of: self)).url(forResource: "CurrentCommits", withExtension: "json") else {
            completion?(.failure(NetworkError.other(message: "Could not parse Commits json file")))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSON(data: data)
            let commits = json.arrayValue.compactMap { GitHubCommit(json: $0) }
            guard  commits.count > 0 else {
                completion?(.failure(NetworkError.other(message: "Commit parsing failed")))
                return
            }
            
            let params = request.queryParameters
            let size = params["per_page"] as? Int
            let until = params["until"] as? String
            var belowDate : Date? = nil
            let formatter = ISO8601DateFormatter()
            if let until = until {
                belowDate = formatter.date(from: until)
            }
            if belowDate == nil {
                if size == nil {
                    completion?(.success(commits))
                } else {
                    let headcommits = Array(commits[0..<size!])
                    completion?(.success(headcommits))
                }
            } else {
                let below = belowDate!
                if size == nil {
                    
                    if let first = commits.firstIndex(where: { $0.date < below }) {
                        let nextcommits = Array(commits[first..<commits.count])
                        completion?(.success(nextcommits))
                    } else {
                        // we are at a date before any available
                        completion?(.success([Commit]()))
                    }
                    
                } else { // we have a date and a page size
                    let page = size!
                    if let first = commits.firstIndex(where: { $0.date < below }) {
                        
                        if (first + page) < commits.count {
                            let commits = Array(commits[first..<first+page])
                            completion?(.success(commits))
                        } else {
                            let commits = Array(commits[first..<commits.count])
                            completion?(.success(commits))
                        }
                        
                    } else {
                        // we are at a date before any available
                        completion?(.success([Commit]()))
                    }
                    
                }
            }
            
            
        } catch {
            completion?(.failure(error))
        }
        
    }
    
}

