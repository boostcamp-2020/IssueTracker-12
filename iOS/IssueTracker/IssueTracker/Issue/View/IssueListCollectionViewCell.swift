//
//  IssueListCollectionViewCell.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/26.
//

import UIKit
//import SwipeCellKit

@IBDesignable
class IssueListCollectionViewCell: UICollectionViewListCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var openLabel: PaddedLabel!
    @IBOutlet weak var milestoneLabel: PaddedLabel!
    @IBOutlet weak var labelScrollView: UIScrollView!
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var newBackgroundConfiguration = UIBackgroundConfiguration.listPlainCell()
        newBackgroundConfiguration.backgroundColor = .systemBackground
        backgroundConfiguration = newBackgroundConfiguration
        layoutIfNeeded()
    }
    
    func initIssueCell(issue: Issue) {

        DispatchQueue.main.async { [weak self] in
            self?.titleLabel.text = issue.title
            self?.openLabelConfigure(isOpen: issue.isOpen)
            self?.labelsConfigure(labels: issue.labels)
            if let milestone = issue.milestoneTitle {
                self?.milestoneLabel.text = milestone
            } else {
                self?.milestoneLabel.alpha = 0
            }
        }
    }
    
    private func openLabelConfigure(isOpen: Int) {
        
        // * TO-DO :
        // - label 크기 따로 변수 선언
        // - 다른 화면에서도 사용할 수 있도록 Extension 빼기
        var imageName = "openMark"
        var text = " Open"
        var textColor = UIColor(named: "openIssueColor")
        var backgroundColor = UIColor(named: "openIssue Background Color")
        if isOpen == IssueOpen.closed.rawValue {
            imageName = "closeMark"
            text = " Closed"
            textColor = UIColor(named: "closeIssueColor")
            backgroundColor = UIColor(named: "closeIssue Background Color")
        }
        guard let iconImage = UIImage(named: imageName) else { return }
        guard let issueFont = openLabel.font else { return }
        
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = iconImage
        
        imageAttachment.bounds = CGRect(x: 0, y: issueFont.descender, width: 15, height: 15)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: text))
        openLabel.attributedText = attributedString
        openLabel.textColor = textColor
        openLabel.backgroundColor = backgroundColor
    }
    
    private func labelsConfigure(labels: [Label]) {
        
        var xPosition: CGFloat = 0
        labels.forEach { label in
            let newLabel = PaddedLabel()
            newLabel.text = label.labelName
            newLabel.backgroundColor = UIColor(hex: label.color)
            newLabel.textAlignment = .center
            newLabel.paddingWidth = 14
            newLabel.paddingHeight = 10
            newLabel.cornerRadius = 10
            let labelWidth = newLabel.intrinsicContentSize.width
            
            newLabel.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: 20)
            
            xPosition += (labelWidth + 6)
            labelScrollView.addSubview(newLabel)
            labelScrollView.contentSize.width = xPosition
        }
    }
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
