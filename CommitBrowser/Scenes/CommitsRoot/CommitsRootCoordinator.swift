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
    
    private lazy var navigationController : UINavigationController = {
        let nc = UINavigationController()
        nc.navigationBar.prefersLargeTitles = true
        return nc
    }()
    
    override func start() {
        let commitsRootController = CommitsRootController.instantiate()
        let service = GitHubNetworkService()
        let repository = Repository.defaultRepository
        let model = GitHubCommitsRootViewModel(service, repository: repository)
        commitsRootController.model = model
        navigationController.pushViewController(commitsRootController, animated: false)
    }

}
