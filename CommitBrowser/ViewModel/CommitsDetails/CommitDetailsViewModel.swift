//
//  CommitDetailsViewModel.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import Foundation

protocol CommitDetailsViewModel {
    var commit : Commit { get }
    var sections : Int { get }
    var files : Observable<[File]> { get }
    var numberOfFiles : Int { get }
    var hasFiles : Bool { get }
    var isFetching : Bool { get }
    func fileAt(_ index : IndexPath) -> File?
    func fetch(_ completion : ((Error?) -> ())?)
    func numberOfRows(_ section : Int) -> Int
}
