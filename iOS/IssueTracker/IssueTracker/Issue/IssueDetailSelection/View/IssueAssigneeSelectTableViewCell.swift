//
//  IssueAssigneeSelectTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueAssigneeSelectTableViewCell: UITableViewCell {
    @IBOutlet weak var assigneeImageView: UIImageView!
    @IBOutlet weak var assigneeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
