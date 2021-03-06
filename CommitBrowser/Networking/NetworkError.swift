//
//  NetworkError.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation


/// Network error type
enum NetworkError : Error, LocalizedError {
    case noContent
    case invalidCode(_ code : Int?, message : String?)
    case other(message : String)
    
    public var errorDescription: String? {
        switch self {
        case .noContent:
            return NSLocalizedString("Empty response content.", comment: "NetworkError")
        case .invalidCode(let code, let message):
            var message = message ?? "Unknown error"
            message = code != nil ? "\(code!) : \(message)" : message
            return NSLocalizedString(message, comment: "NetworkError")
        case .other(let message):
            return NSLocalizedString(message, comment: "NetworkError")
        }
    }
}
