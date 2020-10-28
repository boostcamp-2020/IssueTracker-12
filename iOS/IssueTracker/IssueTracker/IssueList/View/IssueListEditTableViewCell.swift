//
//  IssueListEditTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/27.
//

import UIKit
import M13Checkbox

class IssueListEditTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: M13Checkbox!
    @IBOutlet weak var titleLabel: UIView!
    @IBOutlet weak var contentLabel: UIView!
    @IBOutlet weak var milestoneLabel: PaddedLabel!
    @IBOutlet weak var labelLabel: PaddedLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            checkbox.checkState = .checked
        } else {
            checkbox.checkState = .unchecked
        }
    }

}
