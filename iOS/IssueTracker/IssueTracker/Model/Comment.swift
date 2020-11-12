//
//  Comment.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/12.
//

import Foundation

struct Comment: Codable, Hashable {
    var commentID: Int
    var writerID: Int
    var issueID: Int
    var userName: String
    var contents: String
    var writeTime: String
    var isIssueContent: Int
    
    init(commentID: Int, writerID: Int, issueID: Int, userName: String, contents: String, writeTime: String, isIssueContent: Int) {
        
        self.commentID = commentID
        self.writerID = writerID
        self.issueID = issueID
        self.userName = userName
        self.contents = contents
        self.writeTime = writeTime
        self.isIssueContent = isIssueContent
    }
    
    enum CodingKeys: String, CodingKey {
        case commentID = "comment_id"
        case writerID = "writer_id"
        case issueID = "issue_id"
        case userName = "username"
        case contents = "content"
        case writeTime = "write_time"
        case isIssueContent = "is_issue_content"
    }
}

struct CommentArray: Codable, Hashable {
    let commentArray: [Comment]
    
    enum CodingKeys: String, CodingKey {
        case commentArray = "commentArr"
    }
}
