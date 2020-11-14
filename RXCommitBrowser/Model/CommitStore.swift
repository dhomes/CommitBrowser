//
//  CommitStore.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import Foundation
import Combine

final class CommitStore : ObservableObject {
    
    var bag = Set<AnyCancellable>()
    
    @Published var commits : [Commit] = [Commit]()
    @Published var isError : Bool = false
    private var hasMore = true
    private let pageSize : Int = 10
    
    var error : Error? = nil {
        didSet {
            isError = error != nil
        }
    }
    let mainQueue = DispatchQueue.main
    let service = RxNetworkService()
    
    func fetch(direction : FetchDirection) {
        if !hasMore {
            return
        }
        let repo = Repository.defaultRepository
        var query = Query(pageSize: pageSize, below: nil)
        
        switch direction {
        case .top:
            break
        case .bottom:
            let min = commits.map { $0.date}.min()?.addingTimeInterval(-0.1)
            query = Query(pageSize: pageSize, below: min )
        }
        let page = pageSize
        let request = GitHubRequest.getCommits(repo, query)
        let cancellable = service.commits(request: request).receive(on: RunLoop.main).sink { result in
            switch result {
            case .failure(let error):
                self.error = error
            case .finished:
                return
            }
        } receiveValue: { commits in
            self.hasMore = commits.count >= page
            switch direction {
            case .top:
                self.commits = commits
            case .bottom:
                self.commits.append(contentsOf: commits)
            }
        }
        bag.insert(cancellable)

    }
    
    func isLast(_ commit : Commit) -> Bool {
        if let last = self.commits.last, last.hash == commit.hash {
            return true
        }
        return false
    }
}
