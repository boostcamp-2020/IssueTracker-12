//
//  Issue.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Issue: Codable, Hashable {
    let issueId: Int
    let title: String
    let milestoneId: Int?
    let milestoneTitle: String?
    let writeTime: String
    let isOpen: Int
    let writerId: Int
    let writer: String
    let labels: [Label]
    
    init(title: String, milestoneId: Int?, milestoneTitle: String?, writeTime: String, isOpen: Int,
         writerId: Int, writer: String, labels: [Label]) {
        self.issueId = -1
        self.title = title
        self.milestoneId = milestoneId
        self.milestoneTitle = milestoneTitle
        self.writeTime = writeTime
        self.isOpen = isOpen
        self.writerId = writerId
        self.writer = writer
        self.labels = labels
    }
    
    enum CodingKeys: String, CodingKey {
        case issueId = "issue_id"
        case title
        case milestoneId = "milestone_id"
        case milestoneTitle = "milestone_title"
        case writeTime = "write_time"
        case isOpen = "is_open"
        case writerId = "writer_id"
        case writer
        case labels
    }
}

struct IssueArray: Codable, Hashable {
    let issueArray: [Issue]
    
//    enum CodingKeys: String, CodingKey {
//        case issueArray
//    }
}
