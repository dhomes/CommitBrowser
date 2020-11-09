//
//  GitHubCommitDetailsViewModel.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import Foundation

class GitHubCommitDetailsViewmodel <T : NetworkService>: CommitDetailsViewModel {
    var commit: Commit
    var sections: Int { return 2 }
    var files: Observable<[File]> = Observable([File]())
    var numberOfFiles: Int { files.value.count }
    var hasFiles: Bool { files.value.count > 0 }
    var isFetching: Bool = false
    var networkService : T
    
    init(_ networkService : T, commit : Commit) {
        self.networkService = networkService
        self.commit = commit
    }
    
    func fileAt(_ index: IndexPath) -> File? {
        if index.section == 0 {
            return nil
        }
        if index.section == 1 && hasFiles {
            return files.value[index.row]
        }
        return nil
    }
    
    func fetch(_ completion: ((Error?) -> ())?) {
        if isFetching { return }
        isFetching = true
        networkService.getFiles(for: commit) { [weak self] result in
            defer { self?.isFetching = false }
            let queue = DispatchQueue.main
            switch result {
            case .failure(let error):
                self?.files.value = [File]()
                queue.async { completion?(error) }
            case .success(let files):
                self?.files.value = files
                queue.async { completion?(nil) }
            }
        }
    }
    
    func numberOfRows(_ section : Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return max(files.value.count, 1)
        default:
            return 0
        }
    }
}
