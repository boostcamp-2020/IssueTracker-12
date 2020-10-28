//
//  UIViewController+Extension.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation
import UIKit

extension UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
