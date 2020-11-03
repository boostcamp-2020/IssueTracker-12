//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit
import SwipeCellKit

@IBDesignable
class IssueListCollectionViewCell: SwipeCollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var openLabel: PaddedLabel!
    @IBOutlet weak var milestoneLabel: PaddedLabel!
    @IBOutlet weak var labelLabel: PaddedLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    func configure() {
        
        openLabelConfigure()
        
    }
    
    private func openLabelConfigure() {
        
        // - TO-DO :
        // - open, close 여부 인자로 받아 분기/변수 처리
        // - label 크기 따로 변수 선언
        guard let iconImage = UIImage(named: "openMark") else { return }
        guard let issueFont = openLabel.font else { return }
        
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = iconImage
        
        imageAttachment.bounds = CGRect(x: 0, y: issueFont.descender, width: 15, height: 15)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: " Open"))
        openLabel.attributedText = attributedString
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
