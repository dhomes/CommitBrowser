//
//  CommitsRootCoordinator.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

/// Coordinator setting the CommitsRootsController & ViewModel 
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
        let model = GitHubCommitsRootViewModel(service, repository: repository, pageSize: 10)
        commitsRootController.model = model
        commitsRootController.onCommitSelected = { [weak self] commit in
            self?.goToCommit(commit)
        }
        navigationController.pushViewController(commitsRootController, animated: false)
    }
    
    func goToCommit(_ commit : Commit) {
        let commitDetailCoordinator = CommitDetailCoordinator(commit)
        pushCoordinator(commitDetailCoordinator)
        navigationController.pushViewController(commitDetailCoordinator.viewController, animated: true)
    }

}
