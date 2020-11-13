//
//  IssueDetailTableViewCell.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit
import MarkdownKit

class IssueDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setupView(comment: Comment) {
        
        commentTextView.attributedText = MarkdownParser().parse(comment.contents)
        nameLabel.text = comment.userName
        if let date = comment.writeTime.split(separator: "T").first?.split(separator: "-") {
            dateLabel.text = "\(date[0])년 \(date[1])월 \(date[2])일"
        }
        
        let width = commentTextView.frame.width
        let newSize = commentTextView.sizeThatFits(CGSize(width: width, height: .infinity))
        commentTextView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = newSize.height
            }
        }
    }
}
