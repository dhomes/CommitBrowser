//
//  StoryboardInstantiable.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

/// Protocol to be adapted by controllers that are initial view controllers in a storyboard
protocol StoryboardInstantiable {
    
    /// the storyboard enum each view controller is in
    static var storyboard : Storyboard { get }
    
    /** the instantiate from storyboard method for the controller
        controller must be set as initial view controller of the storyboard
        and it's type set in Storyboard as well */
    static func instantiate() -> Self
}

extension StoryboardInstantiable where Self : UIViewController {
    static func instantiate() -> Self {
        let storyboardName = self.storyboard.rawValue
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let controller = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate \(storyboardName) as initial controller of \(storyboardName).storyboard")
        }
        return controller
    }
}

