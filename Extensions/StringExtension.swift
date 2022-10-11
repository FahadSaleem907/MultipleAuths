//
//  StringExtension.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

extension String{
    
    ///You can get closest to as many decimal places as you want correctly
    ///If the return value has less then 2 decimal placess then
    ///Always returns near 2 decimal places String
    ///Eg: 1 becomes 1.00, or 1.2 becomes 1.20
    func convertToDoubleOrString(decimalPlaces: Int16) -> (String?, Double?){
        let convertedDoubleVal = Double(self) ?? 0.0
//        let numberOfDecimalPlaces: Int16 = 2
        ///Set Behaviour For Decimal Place
        let decimalBehaviours = NSDecimalNumberHandler(roundingMode: .plain, scale: decimalPlaces, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        
        ///Round converted double value according to behaviours for decimal
        let roundedDoubleValue = NSDecimalNumber(value: convertedDoubleVal).rounding(accordingToBehavior: decimalBehaviours)
        
        ///Convert rounded value from NSDecimalNumber to String to get exact rounded figure
        var convertedStringVal = "\(roundedDoubleValue)"
        
        ///Convert String value back to Double to return
        let finalDoubleVal = Double(convertedStringVal) ?? 0.0
        if convertedStringVal.contains(".") == true{
            let priceToShowDic = convertedStringVal.components(separatedBy: ".")
            if priceToShowDic.last?.description.count != 2{
                convertedStringVal = (convertedStringVal) + "0"
            }
        } else {
            convertedStringVal = (convertedStringVal) + ".00"
        }
        let roundedVal = (convertedStringVal, finalDoubleVal)
        return roundedVal
    }
}
