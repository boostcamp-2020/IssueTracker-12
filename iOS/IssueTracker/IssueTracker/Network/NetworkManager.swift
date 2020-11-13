//
//  NetworkManager.swift
//  IssueTracker
//
//  Created by 박성민 on 2020/11/03.
//

import Foundation
import Alamofire

class NetworkManager {
    
    public static let shared = NetworkManager()
    
    private var token: String?
    private var headers: HTTPHeaders?
       
    func updateHeader() {
        
        guard let token = UserDefaults.standard.object(forKey: "token") as? String else { return }
        headers = [
            "Authorization": "Bearer \(token)"
        ]
    }
    
    func loginRequest<T: Encodable>(url: URLs, type: T.Type, object: T, completion: @escaping (LoginResponse?) -> Void) {
        
        let alamo = AF.request(url.rawValue, method: .get, parameters: object).validate(statusCode: 200..<300)

        alamo.responseJSON { response in
            switch response.result {
            case .success :
                guard let data = response.data else { return }
                let result = self.decodeJSON(data: data, type: LoginResponse.self)
                completion(result)
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func getRequest<T: Decodable>(url: URLs, urlAdd: String = "", type: T.Type, completion: @escaping (T?) -> Void) {
        let alamo = AF.request("\(url.rawValue)\(urlAdd)", method: .get, parameters: nil, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success :
                guard let data = response.data else { return }
                let result = self.decodeJSON(data: data, type: type)
                completion(result)
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func postRequest<T: Encodable>(url: URL, object: T, type: T.Type, completion: @escaping (ResponseData?) -> Void) {
        
        let alamo = AF.request(url, method: .post, parameters: object, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success :
                guard let data = response.data else { return }
                let result = self.decodeJSON(data: data, type: ResponseData.self)
                completion(result)
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func deleteRequest(url: URLs, deleteID: Int, completion: @escaping (NSDictionary) -> Void) {
        let alamo = AF.request("\(url.rawValue)/\(deleteID)", method: .delete, parameters: nil, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(let value) :
                if let nsDictionary = value as? NSDictionary {
                    completion(nsDictionary)
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func putRequest<T: Encodable>(url: URLs, updateID: Int, object: T, type: T.Type, completion: @escaping (NSDictionary) -> Void) {
        let alamo = AF.request("\(url.rawValue)/\(updateID)", method: .put, parameters: object, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(let value) :
                if let nsDictionary = value as? NSDictionary {
                    completion(nsDictionary)
                }
            case .failure(let error) :
                print(error)
            }
            
        }
    }
    
    func patchRequest<T: Encodable>(url: URL, updateID: Int, object: T, completion: @escaping (NSDictionary) -> Void) {
    
        let alamo = AF.request(url, method: .patch, parameters: object, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(let value) :
                if let nsDictionary = value as? NSDictionary {
                    completion(nsDictionary)
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func patchRequest2<T: Encodable>(url: URLs, updateID: Int, object: T, type: PatchType, completion: @escaping (NSDictionary) -> Void) {
    
        let alamo = AF.request("\(url.rawValue)/\(updateID)/\(type.rawValue)", method: .put, parameters: object, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(let value) :
                if let nsDictionary = value as? NSDictionary {
                    completion(nsDictionary)
                }
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    private func decodeJSON<T: Decodable>(data: Data, type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else { return nil }
        
        return decodedData
    }
}
