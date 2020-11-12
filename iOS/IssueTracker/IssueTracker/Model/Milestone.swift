//
//  Milestone.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Milestone: Codable, Hashable {
    let milestoneId: Int
    var title: String
    var dueDate: String
    var content: String
    let issueInfo: IssueInfo?
    
    init(title: String, dueDate: String, content: String, issueInfo: IssueInfo? = nil) {
        self.milestoneId = -1
        self.title = title
        self.dueDate = dueDate
        self.content = content
        self.issueInfo = issueInfo
    }
    
    enum CodingKeys: String, CodingKey {
        case milestoneId = "milestone_id"
        case title
        case dueDate = "due_date"
        case content
        case issueInfo
    }
}

struct MilestoneArray: Codable, Hashable {
    let milestoneArray: [Milestone]
    
    enum CodingKeys: String, CodingKey {
        case milestoneArray
    }
}

struct IssueInfo: Codable, Hashable {
    let openedIssue: Int
    let closedIssue: Int
    let completed: String
    
    init(openedIssue: Int, closedIssue: Int, completed: String) {
        self.openedIssue = openedIssue
        self.closedIssue = closedIssue
        self.completed = completed
    }
    
    enum CodingKeys: String, CodingKey {
        case openedIssue
        case closedIssue
        case completed
    }
}
