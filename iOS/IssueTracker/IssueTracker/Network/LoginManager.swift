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
        
        let oAuth = OAuth(code: code, clientId: GithubConstants.clientID, clientSecret: GithubConstants.clientSecret)
        NetworkManager.shared.loginRequest(url: .login, type: OAuth.self, object: oAuth) { result in
            guard let user = result else { return }
            print(user)
            
            if user.userInfo.userId == nil || !user.isExistUser {
                let object = ["username": user.userInfo.userName,
                              "social": user.userInfo.social]
                let alamo = AF.request(URLs.userSave.rawValue, method: .post, parameters: object, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300)
                alamo.responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        guard let dic = value as? NSDictionary else { return }
                        let userInfo = UserInfo(social: user.userInfo.social, url: user.userInfo.url, userName: user.userInfo.userName, userId: dic["insertId"]! as? Int)
                        self.requestSignIn(user: userInfo)
                    case .failure(let error):
                        print(error)
                    }
                }
            } else {
                self.requestSignIn(user: user.userInfo)
            }
        }
    }
    
    func requestSignIn(user: UserInfo) {
        let object = ["username": user.userName,
                      "social": user.social,
                      "password": "NoAnswer"]
        
        let alamo = AF.request(URLs.signIn.rawValue, method: .post, parameters: object, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let dic = value as? NSDictionary else { return }
                guard let token = dic["token"] as? String else { return }
                self.saveUserData(user: user, token: token)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func saveUserData(user: UserInfo, token: String) {
        UserDefaults.standard.set(true, forKey: "didLogin")
        UserDefaults.standard.set(user.userId, forKey: "userID")
        UserDefaults.standard.set(user.userName, forKey: "userName")
        UserDefaults.standard.set(token, forKey: "token")
        
        NotificationCenter.default.post(name: .loginDidSuccess, object: nil)
    }
}
