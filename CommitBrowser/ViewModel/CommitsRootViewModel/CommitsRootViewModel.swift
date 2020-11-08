//
//  CommitViewModel.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import Foundation

/// ViewModel protocol for CommitsRoot
protocol CommitsRootViewModel {
    var commits : Observable<[Commit]> { get }
    var numberOfRows : Int { get }
    var hasCommits : Bool { get }
    func commitAt(_ index : IndexPath) -> Commit?
    func fetch(from direction : FetchDirection, completion : ((Error?) -> ())?)
    var isFetching : Bool { get }
}



