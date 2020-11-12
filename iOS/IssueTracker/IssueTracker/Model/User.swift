//
//  User.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/05.
//

import Foundation

struct User: Codable, Hashable {
    
    let userId: Int
    var userName: String
    var social: String
    
    init(userName: String, social: String) {
        self.userId = -1
        self.userName = userName
        self.social = social
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userName = "username"
        case social
    }
}

struct UserArray: Codable, Hashable {
    let userArray: [User]
    
    enum CodingKeys: String, CodingKey {
        case userArray
    }
}
