//
//  LoginViewController.swift
//  IssueTracker
//
//  Created by 이승진 on 2020/11/02.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var githubIDButton: UIButton!
    @IBOutlet weak var oAuthStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let didLogin = UserDefaults.standard.object(forKey: "didLogin") as? Bool, didLogin {
            NetworkManager.shared.updateHeader()
            openMainView()
        }

        setupProviderLoginView()
    }
    
    func setupProviderLoginView() {
        
        githubIDButton.addTarget(self, action: #selector(handleAuthorizationGithubIDButtonPress), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(successLogin), name: .loginDidSuccess, object: nil)
        
        let appleIDButton = ASAuthorizationAppleIDButton()
        appleIDButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        self.oAuthStackView.addArrangedSubview(appleIDButton)
      }
    
    @objc
    func handleAuthorizationGithubIDButtonPress() {
      
        LoginManager.shared.requestCode()
    }
    
    @objc func successLogin() {
        openMainView()
    }
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
      
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    private func openMainView() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)

            guard let tabBarController = storyboard.instantiateViewController(withIdentifier: "UITabBarController")
                    as? UITabBarController else { return }

            self.view.window?.rootViewController = tabBarController
        }
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    
    // 성공 시, 인증 정보 반환
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            LoginManager.shared.requestAppleUserExist(identifier: userIdentifier)
        
        case let passwordCredential as ASPasswordCredential:
            let userName = passwordCredential.user
            let password = passwordCredential.password
            
        default:
            break
        }
    }
    
    // 인증 에러
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
        print(error)
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
