//
//  SupportFunctions.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

class SupportFunctions{
    static let shared = SupportFunctions()
    private init() {}
    
    struct UIFunctions {
        
    }
    
    struct Validation{
        func isValidEmail(textFieldName: UITextField) -> Bool{
                let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
                return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: textFieldName.text)
            }
            
            func isValidPassword(textFieldName: UITextField) -> Bool{
                let pwRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$"
                return NSPredicate(format: "SELF MATCHES %@", pwRegex).evaluate(with: textFieldName.text)
            }
    }
    
    struct otherFunctions{
        static func openUrl(urlString: String){
            if let url = URL(string: "\(urlString)"){
                UIApplication.shared.open(url)
            }
        }
        
        static func encodeStringToBase64(textToConvert: String) -> (Bool, String){
            var encodedString = ""
            var success = false
            let utf8str = textToConvert.data(using: .utf8)
            if let base64EncodedValue = utf8str?.base64EncodedString(options: []){
                success = true
                encodedString = base64EncodedValue
            } else {
                success = false
                encodedString = "Failed"
            }
            
            return (success, encodedString)
        }
        
        static func decodeStringFromBase64(textToConvert: String) -> (Bool, String){
            var decodedString = ""
            var success = false
            
            if let base64DecodedValue = Data(base64Encoded: textToConvert, options: [])
                .map({ first in
                    ///Converting Back Into String Val
                    String(data: first, encoding: .utf8) }) {
                
                success = true
                decodedString = base64DecodedValue ?? ""
            } else {
                success = false
                decodedString = "Failed due to invalid or missing characters"
            }
            
            return (success, decodedString)
        }
        
    }
}
