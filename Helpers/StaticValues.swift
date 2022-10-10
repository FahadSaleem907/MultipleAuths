//
//  StaticValues.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

class StaticValues{
    static let shared = StaticValues()
    private init() {}
    
    static let delegate = UIApplication.shared.delegate as? AppDelegate
    static let defaults = UserDefaults.standard
}
