//
//  StaticValues.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

final class StaticValues{
    static let shared = StaticValues()
    private init() {}
    
    static let delegate = UIApplication.shared.delegate as? AppDelegate
    static let defaults = UserDefaults.standard
    
    struct Schoology{
        static let realm = "Schoology API"
        static let oauth_consumer_key = ""
        static let oauth_version = "1.0"
        
    }
}
