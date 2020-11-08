//
//  Filter.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import Foundation

struct Filter: Hashable {
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(description)
    }
    
    let criteria: filterable
    let description: String
}

struct MainFilters {
    let contents: [Filter] = [
        Filter(criteria: OpenCriteria(), description: "열린 이슈들"),
        Filter(criteria: CloseCriteria(), description: "닫힌 이슈들"),
        
        Filter(criteria: WriterCriteria(writer: User(userName: "me", social: "test")), description: "내가 작성한 이슈들"),
        Filter(criteria: AssignedCriteria(assignee: User(userName: "me", social: "test")), description: "나한테 할당된 이슈들"),
        Filter(criteria: CommentCriteria(), description: "내가 댓글을 남긴 이슈들")
    ]
}

struct DetailFilters {
    // 필터들 구현 필요
    let contents: [Filter] = [
        Filter(criteria: WriterCriteria(writer: User(userName: "me", social: "test")), description: "작성자"),
        Filter(criteria: WriterCriteria(writer: User(userName: "me", social: "test")), description: "레이블"),
        Filter(criteria: WriterCriteria(writer: User(userName: "me", social: "test")), description: "마일스톤"),
        Filter(criteria: WriterCriteria(writer: User(userName: "me", social: "test")), description: "담당자")
    ]
}
