//
//  Issue.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Issue: Codable, Hashable {
    let issueId: String
    let writer: String
    let title: String
    let milestone: Milestone
    let label: Label
    let writeTime: String
    let isOpened: Bool
    let isAssigned: Bool
    let isMentioned: Bool
    
    enum CodingKeys: String, CodingKey {
        case issueId = "issue_id"
        case writer
        case title
        case milestone
        case label
        case writeTime = "write_time"
        case isOpened = "is_opened"
        case isAssigned = "is_assigned"
        case isMentioned = "is_mentioned"
    }
}
