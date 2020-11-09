//
//  Filter.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import Foundation

class Filter: Hashable {
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(description)
    }
    
    let criteria: filterable
    let description: String
    let hasChild: Bool
    let childItem: [Filter]
    
    init(criteria: filterable, description: String, hasChild: Bool = false, childItem: [Filter] = []) {
        self.criteria = criteria
        self.description = description
        self.hasChild = hasChild
        self.childItem = childItem
    }
    
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
        Filter(criteria: WriterCriteria(
                writer: User(userName: "me", social: "test")),
               description: "작성자",
               hasChild: true,
               childItem: [Filter(criteria: CommentCriteria(), description: "테스트1"),Filter(criteria: CommentCriteria(), description: "테스트2."), Filter(criteria: CommentCriteria(), description: "테스트3")]),
        Filter(criteria: WriterCriteria(
                writer: User(userName: "me1", social: "test")),
               description: "레이블",
               hasChild: true,
               childItem: [Filter(criteria: CommentCriteria(), description: "테스트1"), Filter(criteria: CommentCriteria(), description: "테스트2."), Filter(criteria: CommentCriteria(), description: "테스트3")]),
        Filter(criteria: WriterCriteria(
                writer: User(userName: "me2", social: "test")),
               description: "마일스톤",
               hasChild: true,
               childItem: [Filter(criteria: CommentCriteria(), description: "테스트1"), Filter(criteria: CommentCriteria(), description: "테스트2."), Filter(criteria: CommentCriteria(), description: "테스트3")]),
        Filter(criteria: WriterCriteria(
                writer: User(userName: "me3", social: "test")),
               description: "담당자",
               hasChild: true,
               childItem: [Filter(criteria: CommentCriteria(), description: "테스트1"), Filter(criteria: CommentCriteria(), description: "테스트2."), Filter(criteria: CommentCriteria(), description: "테스트3")])
    ]
}
