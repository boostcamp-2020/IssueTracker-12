//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit

class IssueListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var mileStoneLabel: UIButton!
    @IBOutlet weak var labelLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
