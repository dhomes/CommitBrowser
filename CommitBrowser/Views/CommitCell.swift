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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private static let defaultImage = UIImage(systemName: "person.crop.circle.fill")
    private static let dateFormatter : DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MM/dd/yy hh:mm a v"
        return dateFormatter
    }()
    
    func setCommit(_ commit : Commit) {
        commitHash.text = commit.hash
        commitMessage.text = commit.message
        commitDate.text = Self.dateFormatter.string(from: commit.date)
        authorName.text = commit.authorName
        authorEmail.text = commit.email
        guard let url = commit.authorImageUrl else {
            authorAvatar.image = Self.defaultImage
            return
        }
        let options = ImageLoadingOptions(placeholder: Self.defaultImage, transition: .fadeIn(duration: 0.15))
        let imageRequest = ImageRequest(url: url, processors: [
            ImageProcessors.Circle(border: ImageProcessingOptions.Border(color: .systemBlue, width: 5, unit: .points))
        ])
        Nuke.loadImage(with: imageRequest, options: options, into: authorAvatar)
    }
}
