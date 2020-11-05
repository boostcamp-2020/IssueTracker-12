//
//  LabelCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit
import SwipeCellKit

class LabelCollectionViewCell: SwipeCollectionViewCell {
    
    @IBOutlet weak var nameLabel: PaddedLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initLabelCell(label: Label) {
        DispatchQueue.main.async { [weak self] in
            self?.nameLabel.text = label.name
            self?.nameLabel.backgroundColor = UIColor(hex: label.color)
            self?.descriptionLabel.text = label.description
        }
    }
}
