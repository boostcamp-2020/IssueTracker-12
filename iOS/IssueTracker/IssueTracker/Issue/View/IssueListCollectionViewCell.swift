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
    @IBOutlet weak var labelScrollView: UIScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        configure()
    }
    
    func configure() {
        
        openLabelConfigure()
        labelsConfigure()
        
    }
    
    func initIssueCell(issue: Issue) {
        print("Issue: \(issue)")
//        DispatchQueue.main.async { [weak self] in
//            self?.nameLabel.text = label.name
//            self?.nameLabel.backgroundColor = UIColor(hex: label.color)
//            self?.descriptionLabel.text = label.description
//        }
    }
    
    private func openLabelConfigure() {
        
        // * TO-DO :
        // - open, close 여부 인자로 받아 분기/변수 처리
        // - label 크기 따로 변수 선언
        // - 다른 화면에서도 사용할 수 있도록 Extension 빼기
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
    
    private func labelsConfigure() {
        
        // - TEST
        let labels = ["ios", "test", "web", "dhdhdhdh", "dkkdslk", "fjk", "dkdkfjdl", "dlskjfkel"]
        
        var xPosition: CGFloat = 0
        labels.forEach { label in
            let newLabel = PaddedLabel()
            newLabel.text = label
            newLabel.backgroundColor = UIColor.green
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
