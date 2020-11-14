//
//  Date+Extensions.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import Foundation

extension Date {
    var commitFormat : String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/yy hh:mm a"
        return dateFormatter.string(from: self)
        
    }
    
}
