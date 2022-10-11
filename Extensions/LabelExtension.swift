//
//  LabelExtension.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

extension UILabel{
    func applyStrikeThroughToText(lbl:UILabel)->UILabel{
        let attributeString = NSMutableAttributedString(string: lbl.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributeString.length))
        lbl.attributedText = attributeString
        return lbl
    }
    
    func removeStrikeThroughToText(lbl:UILabel)->UILabel{
        let attributeString = NSMutableAttributedString(string: lbl.text ?? "")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 0, range: NSMakeRange(0, attributeString.length))
        lbl.attributedText = attributeString
        return lbl
    }
}
