//
//  UIVIewController+Extensions.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import UIKit

extension UIViewController {
    
    /// Simple helper function to show an AlertController
    /// - Parameter error: error to display, if any
    func showError(_ error : Error?) {
        guard let e = error else { return }
        let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
}

extension UITableViewController {
    
    /// Registers a ReusableNib conforming Cell
    /// - Parameter reusable: ReusableNib conforming object
    func register(_ reusable : ReusableNib.Type) {
        tableView.register(reusable.nib, forCellReuseIdentifier: reusable.identifier)
    }
    
    /// Deques a UITableViewCell from a ReusableBing conforming object
    /// - Parameters:
    ///   - reusable: the ReusableNib type
    ///   - indexPath: optional IndexPath to deque the cell for
    /// - Returns: Dequed UITableViewCell
    func deque(_ reusable : ReusableNib.Type, for indexPath : IndexPath? = nil) -> UITableViewCell {
        let cell : UITableViewCell?
        if let ip = indexPath {
            cell = tableView.dequeueReusableCell(withIdentifier: reusable.identifier, for: ip)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: reusable.identifier)
        }
        guard let returnCell = cell else {
            fatalError("Could not deque cell with type : \(String(describing: type(of: reusable)))")
        }
        return returnCell
    }
}
