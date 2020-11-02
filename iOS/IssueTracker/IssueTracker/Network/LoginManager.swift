//
//  LoginManager.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/02.
//

import Foundation
import Alamofire

class LoginManager {
    
    static let shared = LoginManager()
    
    private init() {}
    
    func requestCode() {
        
        let urlString = "https://github.com/login/oauth/authorize?client_id=\(GithubConstants.clientID)&scope=\(GithubConstants.scope)"
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            
            // redirect to scene
        }
    }
    
    func requestAccessToken(with code: String) {
        
        let parameters = ["client_id": GithubConstants.clientID,
                          "client_secret": GithubConstants.clientSecret,
                          "code": code]
        let headers: HTTPHeaders = ["Accept": "application/json"]
        AF.request(GithubConstants.tokenURL, method: .post, parameters: parameters, headers: headers).responseJSON { response in
            
            switch response.result {
            case let .success(json):
                if let dic = json as? [String: String] {
                    let accessToken = dic["access_token"] ?? ""
                    print("Github login Success")
                    // KeychainSwift().set(AccesToken, forKey: "accessToken")
                }
            case let .failure(error):
                print(error)
            }
        }
        
    }
    
}
