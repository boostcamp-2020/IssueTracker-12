//
//  NewIssue.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/11.
//

import Foundation

struct NewIssue: Codable, Hashable {

    var writer: String
    var title: String
    var writeTime: String
    
    init(title: String, writer: String, date: Date) {
        self.writer = writer
        self.title = title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.writeTime = dateFormatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        
        case writer
        case title
        case writeTime = "write_time"
    }
}
