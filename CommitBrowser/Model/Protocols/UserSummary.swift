//
//  UserSummary.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import Foundation

protocol UserSummary : Decodable, CustomStringConvertible, Equatable {
    var name : String { get }
    var date : Date { get }
    var email : String { get }
}

extension UserSummary {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.email == rhs.email
    }
}

extension UserSummary {
    var description: String {
        """
        UserSummary:
         name: \(name)
         email: \(email)
         date: \(date.description(with: Locale.current))
        """
    }
}
