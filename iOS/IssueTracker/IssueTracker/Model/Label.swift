//
//  Label.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Label {
    let labelId: String
    let name: String
    let description: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case labelId = "label_id"
        case name
        case description
        case color
    }
}
