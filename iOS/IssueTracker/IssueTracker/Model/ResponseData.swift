//
//  ResponseData.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/11.
//

import Foundation

struct ResponseData: Codable, Hashable {
    
    let insertId: Int
    
    init() {
        insertId = -1
    }
    
    enum CodingKeys: String, CodingKey {
        case insertId
    }
}
