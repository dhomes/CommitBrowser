//
//  CommitTree.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

struct CommitTree : Tree {
    private(set) var sha : String
    private(set) var url: URL
}
