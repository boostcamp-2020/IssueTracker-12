//
//  URLs.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/03.
//

import Foundation

// eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdpdGh1YnRlc3QiLCJzb2NpYWwiOiJnaXRodWIiLCJpYXQiOjE2MDQ1NDAwMjN9.6-w6o538wNQ6OLxiB5lqtO-gaSwpQBdgBRdS-YkFgG4
enum URLs: String {
    case issue = "http://101.101.217.148:8080/api/issue"
    case label = "http://101.101.217.148:8080/api/label"
    case milestone = "http://101.101.217.148:8080/api/milestone"
}
