//
//  NetworkError.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation
enum NetworkError : Error, LocalizedError {
    case noContent
    public var errorDescription: String? {
        switch self {
        case .noContent:
            return NSLocalizedString("Empty response content.", comment: "NetworkError")
        }
    }
}
