//
//  SceneDelegate.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // connect coordinator to RootCoordinator
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        
        let rootCoordinator = CommitsRootCoordinator()
        rootCoordinator.start()
        appWindow.rootViewController = rootCoordinator.viewController
        appWindow.makeKeyAndVisible()
        window = appWindow
        
    }

}

