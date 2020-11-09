//
//  NotificationName.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/04.
//

import Foundation
extension Notification.Name {
    static let issueDidChange = Notification.Name("issueDidChange")
    static let labelDidChange = Notification.Name("labelDidChange")
    static let milestoneDidChange = Notification.Name("milestoneDidChange")
    static let issueFilterDidChange = Notification.Name("issueFilterDidChange")
}
