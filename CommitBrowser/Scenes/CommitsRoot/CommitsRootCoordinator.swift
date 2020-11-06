//
//  CommitsRootCoordinator.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

class CommitsRootCoordinator : Coordinator, ControllerContainingCoordinator {
    
    var viewController: UIViewController! {
        navigationController
    }
    
    private var navigationController = UINavigationController()
    
    override func start() {
        let commitsRootController = CommitsRootController.instantiate()
        navigationController.pushViewController(commitsRootController, animated: false)
    }

}
