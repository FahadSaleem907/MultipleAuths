//
//  UIViewControllerExtension.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

extension UIViewController {
    enum AlertActions {
        case yes
        case no
        case ok
        case cancel
        case custom(text: String)
        
        var text: String {
            switch self {
            case .ok:
                return "Ok"
            case .cancel:
                return "Cancel"
            case let .custom(text):
                return text.uppercased()
            case .yes:
                return "Yes"
            case .no:
                return "No"
            }
        }
    }
    
    func alertFocusTextField(msg:String , controller:UIViewController, textField:UITextField){
        let alertValidation = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default) {
            (_) in textField.becomeFirstResponder()
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func confirmationAlert(title:String, msg:String , controller:UIViewController){
        let alertValidation = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func successPopAlert(title:String, msg:String , controller:UIViewController){
        let alertValidation = UIAlertController(title: "\(title)", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default){ (_) in
            self.navigationController?.popViewController(animated: true)
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    func successDismissAlert(title:String, msg:String , controller:UIViewController){
        let alertValidation = UIAlertController(title: "\(title)", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default){ (_) in
            self.dismiss(animated: true, completion: nil)
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    
    func successPushAlert(title:String, msg:String , identifier:String, controller:UIViewController){
        let alertValidation = UIAlertController(title: "\(title)", message: msg, preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "Okay", style: .default){ (_) in
            self.performSegue(withIdentifier: identifier, sender: self)
        }
        alertValidation.addAction(buttonOK)
        present(alertValidation, animated: true, completion: nil)
    }
    
    
    ///For Adding Custom Alert
    func showAlert(title: String, msg: String , identifier: String? = nil, controller: UIViewController? = nil, alertActions: [AlertActions], okAction: (() -> Void)? = nil, cancelAction: (() -> Void)? = nil) {
        let alertValidation = UIAlertController(title: "\(title)", message: msg, preferredStyle: .alert)
        
        for alertAction in alertActions {
            let action: UIAlertAction
            
            switch alertAction {
            case .cancel:
                let cancelButton = UIAlertAction(title: alertAction.text, style: .destructive){ _ in
                    cancelAction?()
                }
                action = cancelButton
            case .ok:
                let buttonOK = UIAlertAction(title: alertAction.text, style: .default){ [weak self] _ in
                    if let id = identifier {
                        guard let self = self else { return }
                        self.performSegue(withIdentifier: id, sender: self)
                    }
                    okAction?()
                }
                
                action = buttonOK
                
            case .custom:
                let customButton = UIAlertAction(title: alertAction.text, style: .default){ [weak self] _ in
                    if let id = identifier {
                        guard let self = self else { return }
                        self.performSegue(withIdentifier: id, sender: self)
                    }
                    okAction?()
                }
                action = customButton
            case .yes:
                let buttonOK = UIAlertAction(title: alertAction.text, style: .default){ [weak self] _ in
                    if let id = identifier {
                        guard let self = self else { return }
                        self.performSegue(withIdentifier: id, sender: self)
                    }
                    okAction?()
                }
                
                action = buttonOK
            case .no:
                let cancelButton = UIAlertAction(title: alertAction.text, style: .destructive){ _ in
                    cancelAction?()
                }
                action = cancelButton
            }
            
            alertValidation.addAction(action)
        }
        
        present(alertValidation, animated: true, completion: nil)
    }
}
