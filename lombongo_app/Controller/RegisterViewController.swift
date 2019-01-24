//
//  ViewController.swift
//  lombongo_app
//
//  Created by Mauro Benedito on 05/09/18.
//  Copyright © 2018 Mauro Benedito. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    
    let plusPhotoButton: UIButton =
    {
        let param = UIButton(type: .system)
        
        param.setTitle("Add Photo", for: UIControlState.normal)
        param.setTitleColor(UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0), for: UIControlState.normal)
        param.layer.cornerRadius = 70
        param.layer.borderColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:1.0).cgColor
        param.titleLabel?.textColor = UIColor.blue
        param.layer.borderWidth = 2

        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    let fullname: UITextField =
    {
        let param = UITextField()
        param.placeholder = "Full Name"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let username: UITextField =
    {
        let param = UITextField()
        param.placeholder = "username"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let email: UITextField =
    {
        let param = UITextField()
        param.placeholder = "Email"
       
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let iban: UITextField =
    {
        let param = UITextField()
        param.placeholder = "IBAN"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let phonenumber: UITextField =
    {
        let param = UITextField()
        param.placeholder = "TELEMÓVEL"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let password: UITextField =
    {
        let param = UITextField()
        param.placeholder = "Password"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
    }()
    
    let password1: UITextField =
    {
        let param = UITextField()
        param.placeholder = "Repetir a password"
        
        param.borderStyle = .roundedRect
        param.backgroundColor = UIColor(white: 0, alpha: 0.03)
        param.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    
    let registerButton: UIButton =
    {
        let param = UIButton()
        param.setTitle("Registar", for: UIControlState.normal)
        param.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.4)
        param.addTarget(self, action: #selector(handle_registing), for: UIControlEvents.touchUpInside)
        param.isEnabled = false
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(plusPhotoButton)
        view.addSubview(email)
        
        
        setupViews()
        
        view.backgroundColor = UIColor.white
        
    }
    
    @objc func handle_registing()
    {
        print("k")
    }
    
    @objc func handleTextInputChange()
    {
        let formValid = email.text?.characters.count ?? 0 > 0 && fullname.text?.characters.count ?? 0 > 0 && username.text?.characters.count ?? 0 > 0 && password.text?.characters.count ?? 0 > 0 && password1.text?.characters.count ?? 0 > 0 && iban.text?.characters.count ?? 0 > 0 && phonenumber.text?.characters.count ?? 0 > 0 && password1.text == password.text && email.text?.contains("@") ?? true
        
        if formValid
        {
            registerButton.isEnabled = true;
            registerButton.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.9)
        }else
        {
             registerButton.backgroundColor = UIColor(red:0.00, green:0.75, blue:1.00, alpha:0.5)
        }

    }

    func setupViews()
    {
        plusPhotoButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        plusPhotoButton.heightAnchor.constraint(equalToConstant: 140).isActive = true
        plusPhotoButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        registerButton.addTarget(self, action: #selector(register_user), for: UIControlEvents.touchDown)
        
        
        let stackView = UIStackView(arrangedSubviews: [fullname, username, email, iban, password, password1,phonenumber, registerButton])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate(
            [stackView.topAnchor.constraint(equalTo: plusPhotoButton.bottomAnchor, constant: 15),
             stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25),
             stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-25),
             stackView.heightAnchor.constraint(equalToConstant: 360)
            ])
 
    }
    
    @IBAction func register_user()
    {
        let param = Register(email: email.text!, username: username.text!, senha: password1.text!, name: fullname.text!, phonenumber: Int(phonenumber.text!) ?? 0, iban: Int(iban.text!) ?? 0, balance: 0 ?? 0)
        
        param.registerUser { result in
            switch result {
            case .success(let granted) :
                if granted {
                    print("access is granted")
                } else {
                    print("access is denied")
                }
            case .failure(let error): print(error)
            }
        
        
        
    }
    
    

}

}
