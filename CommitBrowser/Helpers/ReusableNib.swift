//
//  ReusableNib.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import UIKit

/// Helper protocol for registering / dequeing / instantiating UITableViewCells & UIViews
protocol ReusableNib : UIView {
    static var identifier : String { get }
    static var nib : UINib { get }
}


extension ReusableNib {
    static var identifier : String {
        String(describing: type(of: self)).replacingOccurrences(of: ".Type", with: "")
    }
    static var nib : UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}
