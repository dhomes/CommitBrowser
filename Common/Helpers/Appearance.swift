//
//  Appearance.swift
//  CommitBrowser
//
//  Created by dhomes on 11/8/20.
//

import UIKit

protocol Appearance {
    var accentColor : UIColor { get }
    var navigationBarBackgroundColor : UIColor { get }
    var tableViewSeparatorColor : UIColor { get }
    var navigationTitleTextColor : UIColor { get }
    var borderColor : UIColor { get }
    var titleColor : UIColor { get }
    var activityIndicatorColor : UIColor { get }
}

extension Appearance {
    private static var defaultColor : UIColor { UIColor.clear }
    var accentColor : UIColor { UIColor(named: "AccentColor") ?? Self.defaultColor }
    var navigationBarBackgroundColor : UIColor { UIColor(named: "BarColor") ?? Self.defaultColor }
    var tableViewSeparatorColor : UIColor { UIColor(named: "SeparatorColor") ?? Self.defaultColor }
    var navigationTitleTextColor : UIColor { UIColor(named: "NavigationTitleTextColor") ?? Self.defaultColor }
    var borderColor : UIColor { UIColor(named: "BorderColor") ?? Self.defaultColor }
    var titleColor : UIColor { UIColor(named: "TitleColor") ?? Self.defaultColor }
    var activityIndicatorColor : UIColor { .white }
}


