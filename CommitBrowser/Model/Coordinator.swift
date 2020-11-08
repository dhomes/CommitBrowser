//
//  Coordinator.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

/// Protocol for Coordinators that must expose a view Coordinator
protocol ControllerContainingCoordinator : Coordinator {
    var viewController : UIViewController! { get }
}


/// Base coordinator object
/// Description: - needs to inherit from NSObject to become delegate of UINavigationController, if needed
class Coordinator : NSObject {
    
    var didFinish : ((Coordinator?) -> Void)?
    var childCoordinators = [Coordinator]()
    
    func start() {}
    
    func pushCoordinator(_ coordinator : Coordinator) {
        coordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
        coordinator.start()
        childCoordinators.append(coordinator)
    }
    
    func popCoordinator(_ coordinator : Coordinator?) {
        if let coordinator = coordinator, let index = childCoordinators.firstIndex(where: { $0 === coordinator}) {
            childCoordinators.remove(at: index)
        }
    }
    
    func popAll() {
        for (_, c) in childCoordinators.enumerated() {
            c.popAll()
        }
        childCoordinators.removeAll()
    }
    
}

extension Coordinator : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {}
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {}
}
