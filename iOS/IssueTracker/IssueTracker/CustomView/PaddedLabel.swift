//
//  PaddedLabel.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/27.
//

import UIKit

class PaddedLabel: UILabel {
    // MARK: - Properties
    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let width = superContentSize.width + padding.width
        let heigth = superContentSize.height + padding.height
        return CGSize(width: width, height: heigth)
    }
    
    private var padding: CGSize = .init(width: 0, height: 0)
    
    // MARK: Padding
    @IBInspectable var paddingWidth: CGFloat {
        get { padding.width }
        set { padding.width = newValue }
    }
    @IBInspectable var paddingHeight: CGFloat {
        get { padding.height }
        set { padding.height = newValue }
    }

}
