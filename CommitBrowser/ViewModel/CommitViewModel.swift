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
    private var networkService: T
    private let repository : Repository
    private var pageSize : Int
    var hasMore = true
    
    init(_ networkService : T, repository : Repository, pageSize : Int = 25) {
        self.networkService = networkService
        self.repository = repository
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
        hasMore = direction == .top ? true : hasMore
        
        let pageSize = self.pageSize
        let query = Query(pageSize: pageSize, below: date)
        let request = GitHubRequest.getCommits(repository, query)
        let currentCommits = self.commits.value
        
        if !hasMore {
            completion?(nil)
            return
        }
        
        networkService.getCommits(with: request) { [weak self] result in
            let mainQueue = DispatchQueue.main
            switch result {
            case .failure(let error):
                mainQueue.async {
                    completion?(error)
                }
            case .success(let commits):
                if direction == .top {
                    self?.commits.value = commits
                } else {
                    self?.hasMore = commits.count == query.pageSize
                    self?.commits.value = currentCommits + commits
                }
            }
        }
    }
}
