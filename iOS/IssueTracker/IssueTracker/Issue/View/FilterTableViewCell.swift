//
//  FilterTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    private var section = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if section == 1 {
            accessoryType = .disclosureIndicator
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if section == 0 {
        accessoryType = selected ? .checkmark : .none
        } else {
            accessoryType = selected ? .detailDisclosureButton : .disclosureIndicator
        }
    }
    
    func setSection(section: Int) {
        self.section = section
    }
}
