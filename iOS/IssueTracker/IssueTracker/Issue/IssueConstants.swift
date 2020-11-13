//
//  IssueConstants.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/10.
//

import Foundation

enum IssueOpen: Int {
    case open = 1
    case closed = 0
    
    var text: String {
        switch self {
        case .open:  return "Open"
        case .closed: return "Close"
        }
    }
    
    var labelText: String {
        switch self {
        case .open:  return "Open"
        case .closed: return "Closed"
        }
    }
        
    var param: Bool {
        switch self {
        case .open:  return true
        case .closed: return false
        }
    }
    
    var image: String {
        switch self {
        case .open:  return "open"
        case .closed: return "closed"
        }
    }
    
    var color: String {
        switch self {
        case .open:  return "openIssueColor"
        case .closed: return "closeIssueColor"
        }
    }
    
    var backgroundColor: String {
        switch self {
        case .open:  return "openIssue Background Color"
        case .closed: return "closeIssue Background Color"
        }
    }
    
    var icon: String {
        switch self {
        case .open:  return "openMark"
        case .closed: return "closeMark"
        }
    }
}
