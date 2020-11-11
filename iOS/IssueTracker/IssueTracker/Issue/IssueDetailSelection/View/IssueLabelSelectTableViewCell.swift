//
//  IssueLabelSelectTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/11.
//

import UIKit

class IssueLabelSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var labelColorView: UIView!
    @IBOutlet weak var labelNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
       
    }

}
