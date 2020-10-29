//
//  UITableViewCell+Extension.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/10/28.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
