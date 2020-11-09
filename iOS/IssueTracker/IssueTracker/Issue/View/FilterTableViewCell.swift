//
//  FilterTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/05.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var accessoryImageView: UIImageView!
    
    private var section = 0
    private var hasChild = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if section == 1 && hasChild {
            accessoryImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if section == 1 && hasChild {
            accessoryImageView.image = selected ? UIImage(systemName: "chevron.down") : UIImage(systemName: "chevron.right")
        } else {
            accessoryImageView.image = selected ? UIImage(systemName: "checkmark") : nil
            
        }
    }
    
    func initCell(filter: Filter, section: Int) {
        self.titleLabel.text = filter.description
        self.section = section
        self.hasChild = filter.hasChild
    }
}
