//
//  FilterCriteria.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import Foundation

protocol Filterable {
    func apply(issues: [Issue]) -> [Issue]
}

class CloseCriteria: Filterable {
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.isOpen == 0 }
    }
}

class OpenCriteria: Filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.isOpen == 1 }
    }
}

class WriterCriteria: Filterable {
    let writer: String
    
    init(writer: String) {
        self.writer = writer
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.writer == writer }
    }
}

class AssignedCriteria: Filterable {
    let assignee: User
    
    init(assignee: User) {
        self.assignee = assignee
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.assignee.contains(assignee) }
    }
}

class CommentCriteria: Filterable {
    func apply(issues: [Issue]) -> [Issue] {
        //로직 추가하기
        return issues
    }
}

class TitleCriteria: Filterable {
    
    let inputText: String
    
    init(input: String) {
        inputText = input
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter {
            $0.title.lowercased().contains(inputText.lowercased()) || inputText == ""
        }
    }
}

class AndCriteria: Filterable {
    let criterias: [Filterable]
    
    init(criterias: [Filterable]) {
        self.criterias = criterias
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        criterias.reduce(issues) { $1.apply(issues: $0) }
    }
}

class OrCriteria: Filterable {
    
    let criterias: [Filterable]
    
    init(criterias: [Filterable]) {
        self.criterias = criterias
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        
        let filterResults = criterias.map { $0.apply(issues: issues) }
        let result = filterResults.reduce([]) { Array(Set($0 + $1))}
        return result.sorted(by: <)
    }
}

class LabelCriteria: Filterable {
    
    let labelId: Int
    
    init(labelId: Int) {
        self.labelId = labelId
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.labels.filter { $0.labelId == labelId }.count > 0 }
    }
}

class MilestoneCriteria: Filterable {
    let milestoneId: Int
    
    init(milestoneId: Int) {
        self.milestoneId = milestoneId
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.milestoneId == milestoneId }
    }
}

class EmptyCriteria: Filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues
    }
}
