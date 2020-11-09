//
//  FilterCriteria.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/08.
//

import Foundation

protocol filterable {
    func apply(issues: [Issue]) -> [Issue]
}

class CloseCriteria: filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.isOpen == 0 }
    }
}

class OpenCriteria: filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.isOpen == 1 }
    }
}

class WriterCriteria: filterable {
    
    let writer: User
    
    init(writer: User) {
        self.writer = writer
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.writer == writer.userName }
    }
}

class AssignedCriteria: filterable {
    
    let assignee: User
    
    init(assignee: User) {
        self.assignee = assignee
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.assignee.contains(assignee) }
    }
}

class CommentCriteria: filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        //로직 추가하기
        return issues
    }
}

class TitleCriteria: filterable {
    
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

class AndCriteria: filterable {
    
    let criterias: [filterable]
    
    init(criterias: [filterable]) {
        self.criterias = criterias
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        criterias.reduce(issues) { $1.apply(issues: $0) }
    }
}

class OrCriteria: filterable {
    
    let left: filterable
    let right: filterable
    
    init(left: filterable, right: filterable) {
        self.left = left
        self.right = right
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        
        let leftResult = left.apply(issues: issues)
        let rightResult = right.apply(issues: issues)
        return Array(Set(leftResult + rightResult)).sorted(by: >)
    }
}

class LabelNameCriteria: filterable {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues.filter { $0.labels.filter{ $0.labelName == name }.count > 0  }
    }
}

class EmptyCriteria: filterable {
    
    func apply(issues: [Issue]) -> [Issue] {
        return issues
    }
}
