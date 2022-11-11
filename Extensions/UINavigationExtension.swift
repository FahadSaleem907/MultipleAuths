//
//  UINavigationExtension.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import Foundation
import UIKit

extension UINavigationController {
    func fadeTo(_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        pushViewController(viewController, animated: false)
    }
    
    
    func popFadeTo(){///_ viewController: UIViewController) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.fade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        popViewController(animated: false)
    }
}

