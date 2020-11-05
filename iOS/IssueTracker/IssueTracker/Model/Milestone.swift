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
    
    init(title: String, dueDate: String, content: String) {
        self.milestoneId = -1
        self.title = title
        self.dueDate = dueDate
        self.content = content
    }
    
    enum CodingKeys: String, CodingKey {
        case milestoneId = "milestone_id"
        case title
        case dueDate = "due_date"
        case content
    }
}

struct MilestoneArray: Codable, Hashable {
    let milestoneArray: [Milestone]
    
    enum CodingKeys: String, CodingKey {
        case milestoneArray //대소문자 결정되면 변경
    }
}
