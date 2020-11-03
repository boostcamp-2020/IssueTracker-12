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
    func getJSON<T: Decodable>(url: URLs, type: T.Type, completion: @escaping (T?) -> Void) {
        let alamo = AF.request(url.rawValue, method: .get, parameters: nil).validate(statusCode: 200..<300)
        
        alamo.responseJSON { response in
            switch response.result {
            case .success(_) :
                guard let data = response.data else {return}
                let result = self.decodeJSON(data: data, type: type)
                completion(result)
            case .failure(let error) :
                print(error)
            }
        }
    }
    
    func postJSON<T: Encodable>(url: URLs, object: T, type: T.Type, completion: @escaping (NSDictionary) -> Void) {
        print("aaa")
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        let jsonData = try? encoder.encode(object)
        
        print(jsonData)
        let alamo = AF.request(url.rawValue, method: .post, parameters: nil).validate(statusCode: 200..<300)
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
    
    func delJSON<T: Decodable>(url: URLs, type: T.Type, completion: @escaping (T?) -> Void) {
        
    }
    
    func putJSON<T: Decodable>(url: URLs, type: T.Type, completion: @escaping (T?) -> Void) {
        
    }
    
    private func decodeJSON<T: Decodable>(data: Data, type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let decodedData = try? jsonDecoder.decode(T.self, from: data) else { return nil }
        
        return decodedData
    }
}
