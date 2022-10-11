//
//  InstagramVC.swift
//  MultipleAuths
//
//  Created by Fahad Saleem on 11/10/2022.
//

import UIKit

class InstagramVC: UIViewController {

    //MARK: - ----- Constants -----
    
    
    //MARK: - ----- Variables -----
    
    
    //MARK: - ----- Outlets -----
    @IBOutlet weak var btnSignIn: UIButton!{
        didSet{
            let height = btnSignIn.frame.size.height
            btnSignIn.layer.cornerRadius = height/2
            btnSignIn.layer.borderWidth = 1
            btnSignIn.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    
    //MARK: - ----- Actions -----
    @IBAction func SignInBtn(_ sender: UIButton) {
        
    }
    
    
    //MARK: - ----- Objc Functions -----
    
    
    //MARK: - ----- Functions -----
    func signInInsta(){
        
    }
    
    
    //MARK: - ----- Life Cycle -----
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
