//
//  LabelCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit
import SwipeCellKit

class LabelCollectionViewCell: SwipeCollectionViewCell {
    
    @IBOutlet weak var labelLabel: PaddedLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
