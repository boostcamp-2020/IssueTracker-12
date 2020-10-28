//
//  Milestone.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Milestone {
    let milestoneId: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case milestoneId = "milestone_id"
        case title
    }
}
