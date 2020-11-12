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
        }
    }
    
    func requestAccessToken(with code: String) {
        
        let oAuth = OAuth(code: code, clientId: GithubConstants.clientID, clientSecret: GithubConstants.clientSecret)
        NetworkManager.shared.loginRequest(url: .login, type: OAuth.self, object: oAuth) { result in
            guard let user = result else { return }
            
            self.requestLogin(user: user)
        }
    }
    
    func requestAppleUserExist(identifier: String) {
        
        guard let userName = identifier.components(separatedBy: ["."]).first else { return }
        let object = ["username": userName,
                      "social": "apple"]
        
        let alamo = AF.request(URLs.appleUserCheck.rawValue, method: .post, parameters: object, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300)

        alamo.responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let dic = value as? NSDictionary,
                      let isExistUser = dic["isExistUser"] as? Bool else { return }
                
                var userInfo = UserInfo(social: "apple", url: nil, userName: userName, userId: nil)
                
                if let user = dic["userId"] as? [NSDictionary],
                   let userId = user[0]["user_id"] as? Int {
                    userInfo.userId = userId
                }
                let loginResponse = LoginResponse(isExistUser: isExistUser, userInfo: userInfo)
                self.requestLogin(user: loginResponse)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func requestLogin(user: LoginResponse) {
        
        var userInfo = user.userInfo
        if !user.isExistUser {
            let object = ["username": userInfo.userName,
                          "social": userInfo.social]
            let alamo = AF.request(URLs.userSave.rawValue, method: .post, parameters: object, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300)
            alamo.responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let dic = value as? NSDictionary,
                          let userId = dic["insertId"]! as? Int else { return }

                    userInfo.userId = userId
                    self.requestSignIn(user: userInfo)

                case .failure(let error):
                    print(error)
                }
            }
        } else {
            self.requestSignIn(user: userInfo)
        }
    }
    
    func requestSignIn(user: UserInfo) {
        
        let object = ["username": user.userName,
                      "social": user.social,
                      "password": "NoAnswer"]
        
        let alamo = AF.request(URLs.signIn.rawValue, method: .post, parameters: object, encoder: JSONParameterEncoder.default).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            print(response)
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
        NetworkManager.shared.updateHeader()
    }
}
