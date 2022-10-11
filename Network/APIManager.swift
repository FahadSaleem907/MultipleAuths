//
//  ApiManager.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Alamofire
import Foundation

class APIManager{
    //MARK: - For Headers
    static func getBasicHeader() -> HTTPHeaders? {
        let token = StaticValues.defaults.value(forKey: "token") as? String ?? ""
        if token == ""{
            return nil
        } else {
            let basicHeader: HTTPHeaders? = ["Authorization": "Bearer \(token)"]
            return basicHeader
        }
//        return basicHeader
    }
    
    
    //MARK: - For Endpoints
    /*
    enum EndPoint{
        case a:
        
        var method: HTTPMethod? {}
        var url: URL? {}
        var params: [String: Any] {
        case let .getProductsForSpecificStore(page):
            var params: [String: Any] = [:]
            if let page = page {
                params["page"] = page
            }
            return params
        }
    }
    */
}
