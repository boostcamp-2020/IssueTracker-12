//
//  Label.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/10/28.
//

import Foundation

struct Label: Codable, Hashable {
    let labelId: Int
    var labelName: String
    var description: String
    var color: String
    
    init(labelName: String, description: String, color: String) {
        self.labelId = -1
        self.labelName = labelName
        self.description = description
        self.color = color
    }
    
    enum CodingKeys: String, CodingKey {
        case labelId = "label_id"
        case labelName = "label_name"
        case description
        case color
    }
}

struct LabelArray: Codable, Hashable {
    let labelArray: [Label]
    
    enum CodingKeys: String, CodingKey {
        case labelArray
    }
}
