//
//  CommitViewModel.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

protocol CommitsRootViewModel {
    var commits : Observable<[Commit]> { get }
    var numberOfCommits : Int { get }
    func commitAt(_ index : IndexPath) -> Commit?
    func fetch(from direction : FetchDirection, completion : ((Error?) -> ())?)
}

enum FetchDirection {
    case top, bottom
}

class GitHubCommitsRootViewModel<T: NetworkService> : CommitsRootViewModel {
    
    var commits : Observable<[Commit]> = Observable([Commit]())
    var networkService: T
    private var owner : String
    private var repo : String
    private var pageSize : Int
    
    init(_ networkService : T, owner: String, repo: String, pageSize : Int = 25) {
        self.networkService = networkService
        self.owner = owner
        self.repo = repo
        self.pageSize = pageSize
    }
    var hasCommits : Bool {
        commits.value.count > 0
    }
    
    var numberOfCommits: Int {
        max(1, commits.value.count)
    }

    func commitAt(_ index : IndexPath) -> Commit? {
        if hasCommits {
            return commits.value[index.row]
        }
        return nil
    }
    
    func fetch(from direction : FetchDirection, completion : ((Error?) -> ())?) {
        let date : Date? = direction == .top ? nil : commits.value.map { $0.date }.min()?.addingTimeInterval(-0.01)
        let request = GitHubRequest.getCommits(owner, repo, pageSize, date)
        networkService.getCommits(with: request) { result in
            let mainQueue = DispatchQueue.main
            switch result {
            case .failure(let error):
                mainQueue.async {
                    completion?(error)
                }
            case .success(_):
                //commits.forEach { CommitView($0)}
                return
            }
        }
        
        
    }
}
