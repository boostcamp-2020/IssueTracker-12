//
//  GithubConstants.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/02.
//

import Foundation

struct GithubConstants {
    
    static let clientID = "d0d2a94a2a601b5bb28a"
    static let clientSecret = "3dde4247f2b919ffeb064f603607d5d87f2f8f31"
    static let redirectionURL = "issuetracker12://login"
    static let scope = "read:user,user:email"
    static let tokenURL = "https://github.com/login/oauth/access_token"
}
