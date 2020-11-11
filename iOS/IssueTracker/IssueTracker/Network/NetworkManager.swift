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
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImdpdGh1YnRlc3QiLCJzb2NpYWwiOiJnaXRodWIiLCJpYXQiOjE2MDQ1NDAwMjN9.6-w6o538wNQ6OLxiB5lqtO-gaSwpQBdgBRdS-YkFgG4"
    let headers: HTTPHeaders
    
    private init() {
        headers = [
            "Authorization": "Bearer \(token)"
        ]
    }
    
    func getRequest<T: Decodable>(url: URLs, type: T.Type, completion: @escaping (T?) -> Void) {
        
        let alamo = AF.request(url.rawValue, method: .get, parameters: nil, headers: headers).validate(statusCode: 200..<300)
        
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
    
    func patchRequest<T: Encodable>(url: URLs, updateID: Int, object: T, type: PatchType, completion: @escaping (NSDictionary) -> Void) {
    
        let alamo = AF.request("\(url.rawValue)/\(updateID)/\(type.rawValue)", method: .patch, parameters: object, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: 200..<300)
        
//        print(alamo.response)
//        print(alamo.response.)
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
