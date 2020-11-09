//
//  PatchDetailCoordinator.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import UIKit

class PatchDetailCoordinator : Coordinator, ControllerContainingCoordinator {
    var viewController: UIViewController!
    var commit : Commit
    var file : File
    
    init(_ commit : Commit, file : File) {
        self.commit = commit
        self.file = file
    }
    
    override func start() {
        let patchDetail = PatchDetailController.instantiate()
        patchDetail.file = file
        patchDetail.commit = commit
        patchDetail.didFinish = { [weak self] in
            self?.didFinish?(self)
        }
        viewController = patchDetail
    }
}
