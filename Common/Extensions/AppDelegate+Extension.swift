//
//  AppDelegate+Extension.swift
//  RXCommitBrowser
//
//  Created by dhomes on 11/13/20.
//

import UIKit

extension UIApplicationDelegate {
    func theme(_ appearance : Appearance) {
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = appearance.navigationBarBackgroundColor
        let titleTextColor = appearance.navigationTitleTextColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleTextColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleTextColor]
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance

    }
}
