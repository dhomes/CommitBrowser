//
//  PatchDetailController.swift
//  CommitBrowser
//
//  Created by dhomes on 11/9/20.
//

import UIKit

class PatchDetailController: UIViewController, StoryboardInstantiable {

    static var storyboard: Storyboard = .patchDetails
    var file : File!
    var commit : Commit!
    var didFinish : (() -> ())? = nil
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.preferredFont(forTextStyle: .title1).bold()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = commit.hash
        textView.text = file.patch
        title = "Patch Details"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if wasPoppedFromNavigation {
            didFinish?()
        }
    }
}
