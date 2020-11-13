//
//  OAuth.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/12.
//

import Foundation

struct OAuth: Codable, Hashable {
    let code: String
    var clientId: String
    var clientSecret: String
    
    init(code: String, clientId: String, clientSecret: String) {
        self.code = code
        self.clientId = clientId
        self.clientSecret = clientSecret
    }
    
    enum CodingKeys: String, CodingKey {
        case code
        case clientId = "client_id"
        case clientSecret = "client_secret"
    }
}

struct LoginResponse: Codable, Hashable {
    let isExistUser: Bool
    let userInfo: UserInfo
    
    init(isExistUser: Bool, userInfo: UserInfo) {
        self.isExistUser = isExistUser
        self.userInfo = userInfo
    }
    
    enum CodingKeys: String, CodingKey {
        case isExistUser
        case userInfo
    }
}

struct UserInfo: Codable, Hashable {
    let social: String
    let url: String?
    let userName: String
    var userId: Int?
    
    init(social: String, url: String?, userName: String, userId: Int?) {
        self.social = social
        self.url = url
        self.userName = userName
        self.userId = userId
    }
    
    enum CodingKeys: String, CodingKey {
        case social
        case url
        case userName = "username"
        case userId = "user_id"
    }
}
