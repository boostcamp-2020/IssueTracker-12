//
//  URLs.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/03.
//

import Foundation

enum URLs: String {
    case issue = "http://101.101.217.148:8080/api/issue"
    case label = "http://101.101.217.148:8080/api/label"
    case milestone = "http://101.101.217.148:8080/api/milestone"
    case user = "http://101.101.217.148:8080/api/user"
    case login = "http://101.101.217.148:8080/api/auth/oauth"
    case userSave = "http://101.101.217.148:8080/api/auth"
    case signIn = "http://101.101.217.148:8080/api/auth/token"
}

enum PatchType: String {
    case isOpen = "isopen"
    case issueTitle = "title"
}
