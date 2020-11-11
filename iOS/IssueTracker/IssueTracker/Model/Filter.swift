//
//  Filter.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import Foundation

class Filter: Hashable {
    static func == (lhs: Filter, rhs: Filter) -> Bool {
        return lhs.uuid == rhs.uuid && lhs.description == rhs.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
        hasher.combine(description)
    }
    
    let uuid = UUID()
    let criteria: Filterable
    let description: String
    let isChild: Bool
    var childItems: [Filter]
    
    init(criteria: Filterable, description: String, isChild: Bool = false, childItem: [Filter] = []) {
        self.criteria = criteria
        self.description = description
        self.isChild = isChild
        self.childItems = childItem
    }
    
    func setChildren(childItems: [Filter]) {
        self.childItems = childItems
    }
    
}

struct MainFilters {
    let contents: [Filter] = [
        Filter(criteria: OpenCriteria(), description: "열린 이슈들"),
        Filter(criteria: CloseCriteria(), description: "닫힌 이슈들")
//        Filter(criteria: WriterCriteria(writer: "githubtest"), description: "내가 작성한 이슈들"),
//        Filter(criteria: AssignedCriteria(assignee: User(userName: "me", social: "test")), description: "나한테 할당된 이슈들"),
//        Filter(criteria: CommentCriteria(), description: "내가 댓글을 남긴 이슈들")
    ]
}

struct DetailFilters {
    // 필터들 구현 필요
    let contents: [Filter] = [
        Filter(criteria: NoneCriteria(type: .writer), description: "작성자"),
        Filter(criteria: NoneCriteria(type: .label), description: "레이블"),
        Filter(criteria: NoneCriteria(type: .milestone), description: "마일스톤"),
        Filter(criteria: NoneCriteria(type: .assignee), description: "담당자")
    ]
}

enum DetailFilterType {
    case writer
    case label
    case milestone
    case assignee
}
