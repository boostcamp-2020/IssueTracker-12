//
//  NewComment.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/11.
//

import Foundation

struct NewComment: Codable, Hashable {

    var writerID: Int
    var contents: String
    var writeTime: String
    var isIssueContent: Bool
    
    init(writerID: Int, contents: String, isIssueContent: Bool, date: Date) {
        
        self.writerID = writerID
        self.contents = contents
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.writeTime = dateFormatter.string(from: date)
        self.isIssueContent = isIssueContent
    }
    
    enum CodingKeys: String, CodingKey {
        
        case writerID = "writer_id"
        case contents = "content"
        case writeTime = "write_time"
        case isIssueContent = "is_issue_content"
    }
}
