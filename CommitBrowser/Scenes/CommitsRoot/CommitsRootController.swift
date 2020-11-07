//
//  CommitsRootController.swift
//  CommitBrowser
//
//  Created by dhomes on 11/6/20.
//

import UIKit

class CommitsRootController: UITableViewController, StoryboardInstantiable {
    
    static var storyboard: Storyboard = .commitsRoot

    //MARK: - Instance Vars
    var model : CommitsRootViewModel! {
        didSet {
            model.commits.valueChanged = { [weak self] error in
                self?.tableView.reloadData()
            }
        }
    }
    
    let refresh = UIRefreshControl()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        refreshFrom(.top)
    }
    
}

extension CommitsRootController {
    
    func setupTableView() {
        register(EmptyCell.self)
        register(CommitCell.self)
        refresh.addAction(.init(handler: { [weak self] _ in
            self?.refreshFrom(.top)
        }), for: .valueChanged)
        tableView.refreshControl = refresh
    }
    
    func refreshFrom(_ direction : FetchDirection) {
        model.fetch(from: direction) { [weak self] error in
            guard let s = self else { return }
            s.showError(error)
            if s.refresh.isRefreshing {
                s.refresh.endRefreshing()
            }
        }
    }
}

extension CommitsRootController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.numberOfRows
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commit = model.commitAt(indexPath) else {
            let cell = deque(EmptyCell.self) as! EmptyCell
            return cell
        }
        let commitCell = deque(CommitCell.self) as! CommitCell
        commitCell.setCommit(commit)
        return commitCell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if !model.hasCommits {
            return tableView.frame.height
        }
        return UITableView.automaticDimension
    }
}

