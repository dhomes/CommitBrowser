//
//  CommitDetailCoodinator.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import UIKit

class CommitDetailCoordinator : Coordinator, ControllerContainingCoordinator {
    
    var viewController: UIViewController!
    
    var commit : Commit
    
    init(_ commit : Commit) {
        self.commit = commit
    }
    
    override func start() {
        let controller = CommitDetailViewController.instantiate()
        let model = GitHubCommitDetailsViewModel(GitHubNetworkService(), commit: commit)
        controller.model = model
        controller.didFinish = { [weak self] in
            self?.didFinish?(self)
        }
        controller.didSelectFile = { [weak self] commit, file in
            self?.goToFile(commit, file)
        }
        viewController = controller
    }
    
    func goToFile(_ commit : Commit, _ file : File) {
        let patchCoordinator = PatchDetailCoordinator(commit, file: file)
        patchCoordinator.didFinish = { [weak self] outCoodinator in
            self?.popCoordinator(self)
        }
        pushCoordinator(patchCoordinator)
        viewController.navigationController?.pushViewController(patchCoordinator.viewController, animated: true)
    }
}
