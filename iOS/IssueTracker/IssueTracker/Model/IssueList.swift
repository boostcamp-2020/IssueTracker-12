//
//  IssueList.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct IssueList {
    let issueList: [Issue]
    
    enum CodingKeys: String, CodingKey {
        case issueList = "issue_list"
    }
}
