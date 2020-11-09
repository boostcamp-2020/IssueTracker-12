//
//  LabelCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/29.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewListCell {
    
    @IBOutlet weak var nameLabel: PaddedLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newBackgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        newBackgroundConfiguration.backgroundColor = .systemBackground
        backgroundConfiguration = newBackgroundConfiguration
        layoutIfNeeded()
    }
    
    func initLabelCell(label: Label) {
        
        DispatchQueue.main.async { [weak self] in
            
            let backgroundColor = UIColor(hex: label.color)
            self?.nameLabel.text = label.labelName
            self?.nameLabel.backgroundColor = backgroundColor
            self?.nameLabel.textColor = backgroundColor?.textColor
            
            self?.descriptionLabel.text = label.description
        }
    }
}
