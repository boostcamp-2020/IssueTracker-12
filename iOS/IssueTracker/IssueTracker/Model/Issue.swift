//
//  Issue.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Issue: Codable, Hashable {
    
    let issueId: Int
    var title: String
    var milestoneId: Int?
    var milestoneTitle: String?
    var writeTime: String
    var isOpen: Int
    var writerId: Int
    var writer: String
    var isAssigned: Int?
    var isMentioned: Int?
    var labels: [Label]
    var assignee: [User]
    
    init(title: String, writer: String) {
        self.issueId = -1
        self.title = title
        self.writeTime = "\(Date())"
        self.isOpen = 1
        self.writerId = -1
        self.writer = writer
        self.labels = []
        self.assignee = []
    }
    
    static func == (lhs: Issue, rhs: Issue) -> Bool {
        return lhs.issueId == rhs.issueId
    }
    
    static func < (lhs: Issue, rhs: Issue) -> Bool {
        return lhs.issueId < rhs.issueId
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(issueId)
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
        case isAssigned = "is_assigned"
        case isMentioned = "is_mentioned"
        case labels
        case assignee
    }
}

struct IssueArray: Codable, Hashable {
    let issueArray: [Issue]
    
    enum CodingKeys: String, CodingKey {
        case issueArray = "issueArr"
    }
}

struct OneIssue: Codable, Hashable {
    let issue: Issue
    
    enum CodingKeys: String, CodingKey {
        case issue
    }
}
