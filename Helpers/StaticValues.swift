//
//  StaticValues.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Alamofire
import Foundation
import UIKit

final class StaticValues{
    static let shared = StaticValues()
    private init() {}
    
    static let delegate = UIApplication.shared.delegate as? AppDelegate
    static let defaults = UserDefaults.standard
    
    struct Schoology{
        ///Header
        ///Keys
        static let realmKey = "realm"
        static let oAuthConsumerKey = "oauth_consumer_key"
        static let oAuthTokenKey = "oauth_token"
        static let oAuthNonceKey = "oauth_nonce"
        static let oAuthTimestampKey = "oauth_timestamp"
        static let oAuthSignatureMethodKey = "oauth_signature_method"
        static let oAuthVersionKey = "oauth_version"
        static let oAuthSignatureKey = "oauth_signature" ///(Note: signature is made by combination of
        
        
        ///Values
        static let realmVal = "Schoology API"
        static let oAuthConsumerVal = "dpf43f3p2l4k3l03" ///Given by schoology to you
        static let oAuthTokenVal = "" ///Two-Leggeds has no token, should be left blank
        static var oAuthNonceVal = "" ///Must be unique string value given to timestamp
        static var oAuthTimestampVal = "" ///
        static let oAuthSignatureMethodVal = "PLAINTEXT"
        static let oAuthVersionVal = "1.0"
        static let oAuthSignatureVal = "kd94hf93k423kf44%26" ///(Note: This value is made up of the oauth_consumer_secret given to you by Schoology. The final "%26" is the URL-encoded version of the "&" character)
        
        
        func createSchoologyHeader() -> HTTPHeaders?{
            var schoologyParams: HTTPHeaders = [:]
            ///Create nonce and timestamp should be diff each time
            let uniqueNonce = UUID().uuidString
            let currentTimeStamp = "\(Date().timeIntervalSince1970)"
            StaticValues.Schoology.oAuthNonceVal = uniqueNonce
            StaticValues.Schoology.oAuthTimestampVal = currentTimeStamp
            let schoologyVal = StaticValues.Schoology.self
            
            schoologyParams[schoologyVal.realmKey] = schoologyVal.realmVal
            schoologyParams[schoologyVal.oAuthConsumerKey] = schoologyVal.oAuthConsumerVal
            schoologyParams[schoologyVal.oAuthTokenKey] = schoologyVal.oAuthTokenVal
            schoologyParams[schoologyVal.oAuthNonceKey] = schoologyVal.oAuthNonceVal
            schoologyParams[schoologyVal.oAuthTimestampKey] = schoologyVal.oAuthTimestampVal
            schoologyParams[schoologyVal.oAuthSignatureMethodKey] = schoologyVal.oAuthSignatureMethodVal
            schoologyParams[schoologyVal.oAuthVersionKey] = schoologyVal.oAuthVersionVal
            schoologyParams[schoologyVal.oAuthSignatureKey] = schoologyVal.oAuthSignatureVal
            
            return schoologyParams
        }
    }
}
