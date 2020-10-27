//
//  IssueListEditTableViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/27.
//

import UIKit
import M13Checkbox

class IssueListEditTableViewCell: UITableViewCell {

    @IBOutlet weak var issueListCell: IssueListCollectionViewCell!
    @IBOutlet weak var checkbox: M13Checkbox!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
