//
//  CommitDetailViewController.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import UIKit

class CommitDetailViewController: UITableViewController, StoryboardInstantiable {
    
    static var storyboard: Storyboard = .commitDetails
    var model : CommitDetailsViewModel!
    var didSelectFile : ((Commit,File) -> ())? = nil
    var didFinish : (() -> ())? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        model.files.valueChanged = { [weak self] _ in
            self?.tableView.reloadSections([1], with: .automatic)
        }
        model.fetch { [weak self] error in
            self?.showError(error)
        }
        title = model.commit.hash
    
    }
    override func viewDidDisappear(_ animated: Bool) {
        super .viewDidDisappear(animated)
        if wasPoppedFromNavigation {
            didFinish?()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 {
            let commitCell = deque(CommitCell.self) as! CommitCell
            commitCell.selectionStyle = .none
            commitCell.accessoryType = .none
            commitCell.setCommit(model.commit)
            return commitCell
        }
        if section == 1 {
            guard let file = model.fileAt(indexPath) else {
                let emptyCell = deque(EmptyCell.self) as! EmptyCell
                emptyCell.isFetching = model.isFetching
                return emptyCell
            }
            let fileCell = deque(FileCell.self) as! FileCell
            fileCell.setFile(file)
            return fileCell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let file = model.fileAt(indexPath) {
            self.didSelectFile?(model.commit,file)
        }
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "Files"
        default:
            return nil
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension CommitDetailViewController {
    func setupTableView() {
        register(EmptyCell.self)
        register(CommitCell.self)
        register(FileCell.self)
    }
}
