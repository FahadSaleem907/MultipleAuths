//
//  RequestManager.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Alamofire
import Foundation

class RequestManager{
    static func request(method: HTTPMethod, url: URL, params: [String: Any], customHeaders: HTTPHeaders? = nil, success: @escaping ((Data?) -> Void), failure: @escaping (Error?) -> Void) {
        AF.request(
            url,
            method: method,
            parameters: params,
            encoding: URLEncoding.default,
            headers: APIManager.getBasicHeader()
        ).validate().responseJSON { dataResponse in
            let response = dataResponse.response
            
            if let response = response {
                switch response.statusCode {
                case 200..<300: ///was 410 for thrivio before
                    success(dataResponse.data)
                    print("Success")
                default:
                    failure(dataResponse.error)
                    print("Error")
                }
            } else {
                print("Response Is Nil")
            }
        }
    }
    
    static func requestWithJsonEncoding(method: HTTPMethod, url: URL, params: [String: Any], customHeaders: HTTPHeaders? = nil, success: @escaping ((Data?) -> Void), failure: @escaping (Error?) -> Void) {
        AF.request(
            url,
            method: method,
            parameters: params,
            encoding: JSONEncoding.default,
            headers: APIManager.getBasicHeader()
        ).validate().responseJSON { dataResponse in
            let response = dataResponse.response
            
            if let response = response {
                switch response.statusCode {
                case 200..<300: ///was 410 for thrivio before
                    success(dataResponse.data)
                    print("Success")
                default:
                    failure(dataResponse.error)
                    print("Error")
                }
            } else {
                print("Response Is Nil")
            }
        }
    }
}
