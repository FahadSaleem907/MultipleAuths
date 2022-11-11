//
//  TextFieldExtension.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

extension UITextField {

    func setDarkGrayUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    func setUnderLineCustomColo(newColor: UIColor) {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = newColor.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func setPlaceholderColor(for txtField: UITextField,color placeholderColor: UIColor, txt placeholderTxt: String){
        txtField.attributedPlaceholder = NSAttributedString(
            string: placeholderTxt,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
    
    func  charactersLimit(count:Int) {
        if (self.text!.count > count) {
            self.deleteBackward()
        }
    }
    
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func applyRightImg(isVisible:Bool){
        let rightImg = UIImage(named: "botArrow")
        
        //This Enables The UIView on left side of TextField which is Disabled by default
        if isVisible == true{
            rightViewMode = .always
        } else {
            rightViewMode = .never
        }
        
        //First Create a custom View to add UIImageView to handle padding
        let view = UIView(frame: CGRect(x: 0, y: 10, width: 30, height: 30))
        
        //Second Create UIImageView to place an image in
        let imageView = UIImageView(frame: CGRect(x: 5, y: 12, width: 15, height: 7))
        
        //Setting image to the UIImageView
        imageView.image = rightImg
        
        //Add the UIImageView as subview for the view
        view.addSubview(imageView)
        
        //Set view as the leftView to override default leftView with our own
        rightView = view
    }
    
    func applyLeftTxt(isVisible:Bool){
        var textToShow = ""
        if isVisible == true{
            textToShow = "*"
        } else {
            textToShow = " "
        }
        
        //This Enables The UIView on left side of TextField which is Disabled by default
        leftViewMode = .always
        
        //First Create a custom View to add UIImageView to handle padding
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        
        //Second Create UIImageView to place an image in
        let labelView = UILabel(frame: CGRect(x: 0, y: 3, width: 10, height: 10))
        labelView.textColor = .red
        
        //Setting image to the UIImageView
        labelView.text = textToShow
        
        //Add the UIImageView as subview for the view
        view.addSubview(labelView)
        
        //Set view as the leftView to override default leftView with our own
        leftView = view
    }
}

