//
//  FileCell.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import UIKit

class FileCell: UITableViewCell, ReusableNib {

    private var file : File! {
        didSet {
            setup()
        }
    }
    
    func setFile(_ file : File) {
        self.file = file
    }
    
    @IBOutlet weak var sha: UILabel!
    @IBOutlet weak var fileName: UILabel!
    
    @IBOutlet weak var additions: UILabel!
    @IBOutlet weak var deletions: UILabel!
    @IBOutlet weak var changes: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var patch: UILabel!
    
    private func setup() {
        sha.text = file.sha
        fileName.text = file.filename
        status.text = file.status
        additions.text = "\(file.additions)"
        deletions.text = "\(file.deletions)"
        changes.text = "\(file.changes)"
        patch.text = "\(file.patch ?? "not set")"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
