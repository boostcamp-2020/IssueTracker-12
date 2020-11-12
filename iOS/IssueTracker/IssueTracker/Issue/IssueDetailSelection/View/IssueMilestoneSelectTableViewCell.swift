//
//  IssueMilestoneSelectTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueMilestoneSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var milestoneTitleLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
