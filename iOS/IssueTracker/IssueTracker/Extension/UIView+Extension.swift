//
//  UIView+Extension.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/27.
//

import Foundation
import UIKit

@IBDesignable extension UIView {
    // MARK: Border
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.map(UIColor.init) }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    // MARK: CornerRadius
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue
            clipsToBounds = newValue > 0 }
    }
}
