//
//  AppDelegate.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        theme(CommitAppearance())
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

private extension AppDelegate {
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

