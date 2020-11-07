//
//  CommitCell.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import UIKit
import Nuke

class CommitCell: UITableViewCell, ReusableNib {

    @IBOutlet weak var commitHash: UILabel!
    @IBOutlet weak var commitMessage: UILabel!
    @IBOutlet weak var commitDate: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var authorEmail: UILabel!
    @IBOutlet weak var authorAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCommit(_ commit : Commit) {
        commitHash.text = commit.hash
        commitMessage.text = commit.message
        commitDate.text = commit.date.description(with: Locale.current)
        authorName.text = commit.authorName
        authorEmail.text = commit.email
    }
}
