//
//  EmptyCell.swift
//  CommitBrowser
//
//  Created by dhomes on 11/7/20.
//

import UIKit

class EmptyCell: UITableViewCell, ReusableNib {

    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var isFetching : Bool = false {
        didSet {
            if isFetching {
                indicator.alpha = 1
                indicator.startAnimating()
                message.alpha = 0
            } else {
                indicator.alpha = 0
                indicator.stopAnimating()
                message.alpha = 1
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
