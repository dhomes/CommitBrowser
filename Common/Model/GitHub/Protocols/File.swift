//
//  File.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import Foundation

protocol File : CustomStringConvertible {
    var sha : String { get }
    var filename : String { get }
    var status : String { get }
    var additions : Int { get }
    var deletions : Int { get }
    var changes : Int { get }
    var blobUrl : URL { get }
    var rawUrl : URL { get }
    var contentsUrl : URL { get }
    var patch : String? { get }
}

extension File {
    var description: String {
        """
        File
        sha \(sha)
        filename \(filename)
        status \(status)
        additions \(additions)
        deletions \(deletions)
        changes \(changes)
        blobUrl \(blobUrl)
        rawUrl \(rawUrl)
        contentsUrl \(contentsUrl)
        patch \(patch ?? "nil")"
        """
    }
}
