//
//  MilestoneCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import UIKit
import SwipeCellKit

class MilestoneCollectionViewCell: SwipeCollectionViewCell {
    
    @IBOutlet weak var titleLabel: PaddedLabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var closedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func initMilestoneCell(milestone: Milestone) {
        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = milestone.title
            self?.dueDateLabel.text = milestone.dueDate
            self?.contentLabel.text = milestone.content
        }
    }
}
