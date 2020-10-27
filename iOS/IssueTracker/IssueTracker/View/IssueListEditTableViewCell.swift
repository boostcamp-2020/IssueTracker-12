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
    @IBOutlet weak var milestoneLabel: UIView!
    @IBOutlet weak var labelLabel: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkbox.toggleCheckState()
    }
    
    

}
extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
