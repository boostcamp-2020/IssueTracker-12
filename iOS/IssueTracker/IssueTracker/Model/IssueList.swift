//
//  IssueList.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct IssueList: Codable {
    let issueList: [Issue]
    
    enum CodingKeys: String, CodingKey {
        case issueList = "issue_list"
    }
}
