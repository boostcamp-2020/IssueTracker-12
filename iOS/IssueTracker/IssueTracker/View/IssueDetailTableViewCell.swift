//
//  IssueDetailTableViewCell.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/27.
//

import UIKit

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
    
    func setupView() {
        
        commentTextView.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
//        commentTextView.text = "ddd"
        
        let width = commentTextView.frame.width
        let newSize = commentTextView.sizeThatFits(CGSize(width: width, height: .infinity))
        commentTextView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = newSize.height
            }
        }
    }

}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
