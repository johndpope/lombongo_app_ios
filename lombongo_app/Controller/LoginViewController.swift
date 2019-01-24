//
//  LoginViewController.swift
//  lombongo_app
//
//  Created by Mauro Benedito on 17/11/2018.
//  Copyright © 2018 Mauro Benedito. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    //============================================================
    let logo_label: UILabel =
    {
        let param = UILabel()
        
        param.text = "Lombongo"
        param.font = UIFont(name: "Chalkduster", size: 20)
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    
    
    let email_field: UITextField =
    {
        let param = UITextField()
        param.placeholder = "example@website.com"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let password_field: UITextField =
    {
        let param = UITextField()
        param.placeholder = "**************"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let loginButton: UIButton =
    {
        let param = UIButton()
        param.setTitle("Registar", for: UIControlState.normal)
        param.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.4)
        param.addTarget(self, action: #selector(handle_login), for: UIControlEvents.touchUpInside)
        param.isEnabled = false
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    //============================================================
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @objc func handleTextInputChange()
    {
        let formValid = email_field.text?.characters.count ?? 0 > 0 && password_field.text?.characters.count ?? 0 > 0 &&  email_field.text?.contains("@") ?? true
        
        if formValid
        {
            loginButton.isEnabled = true;
            loginButton.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.9)
        }else
        {
            loginButton.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.5)
        }
        
    }
    
    
    @IBAction func handle_login()
    {
        let param = Login(email: email_field.text!, password: password_field.text!)
        
        /*param.registerUser { result in
            switch result {
            case .success(let granted) :
                if granted {
                    print("access is granted")
                } else {
                    print("access is denied")
                }
            case .failure(let error): print(error)
            }
            
            
         */
        }
    
}


