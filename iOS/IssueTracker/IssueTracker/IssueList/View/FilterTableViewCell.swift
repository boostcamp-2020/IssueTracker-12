//
//  FilterTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }

}
