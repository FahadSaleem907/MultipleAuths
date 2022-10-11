//
//  SchoologyVC.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import UIKit

class SchoologyVC: UIViewController {

    //MARK: - ----- Constants -----
    //MARK: - ----- Variables -----
    //MARK: - ----- Outlets -----
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var btnSignIn: UIButton!{
        didSet{
            let height = btnSignIn.frame.size.height
            btnSignIn.layer.cornerRadius = height/2
            btnSignIn.layer.borderWidth = 1
            btnSignIn.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    //MARK: - ----- Actions -----
    @IBAction func signInBtn(_ sender: UIButton) {
        print("Sign In Tapped")
    }
    
    
    //MARK: - ----- Objc Functions -----
    //MARK: - ----- Functions -----
    func signInSchoology(){
        print("Function SignInSchoology Initiated")
        
    }
    
    
    //MARK: - ----- Life Cycle -----
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
