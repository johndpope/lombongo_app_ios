//
//  userProfileViewController.swift
//  lombongo_app
//
//  Created by Mauro Benedito on 17/11/2018.
//  Copyright © 2018 Mauro Benedito. All rights reserved.
//

import UIKit

class userProfileViewController: UIViewController {
    let load_background_view: UIView =
    {
        let param = UIView()
        param.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
        param.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismiss_load_view)))
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    let load_form_view: UIView =
    {
        let param = UIView()
        param.backgroundColor = UIColor.white
        param.layer.cornerRadius = 4
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    let load_input_text_form: UITextField =
    {
        let param = UITextField()
        
        param.layer.borderWidth = 2
        param.layer.borderColor = UIColor.red.cgColor
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    let load_input_button_form: UIButton =
    {
        let param = UIButton()
        param.backgroundColor = UIColor.blue
        param.setTitle("Ok", for: UIControlState.normal)
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    //=======================================================================================================================
    
    let main_div: UIView =
    {
        let param = UIView()
        param.backgroundColor = UIColor.white
        param.layer.cornerRadius = 5
        param.layer.masksToBounds = false
        param.layer.shadowRadius = 5
        param.layer.shadowColor = UIColor.black.cgColor
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    
    let user_profile_picture: UIImageView =
    {
        let param = UIImageView()
        let image = UIImage(named: "no_profile")
        
        param.image = image
        
        param.layer.borderWidth = 3
        param.layer.borderColor = UIColor(red:0.94, green:0.97, blue:1.00, alpha:1.0).cgColor
        param.layer.cornerRadius = 75
        param.contentMode = UIViewContentMode.scaleAspectFill
        param.clipsToBounds = true
        
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
    }()
    
    let username_Label: UILabel =
    {
        let param = UILabel()
        
        param.text = "Jorsy Da Gama"
        param.font = UIFont(name:"Arial", size: 20)
        param.font = UIFont.boldSystemFont(ofSize: 20)
        param.textColor = UIColor.lightGray
        
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
        
    }()
    
    let edit_profile_button: UIButton =
    {
        let param = UIButton()
        param.layer.cornerRadius = 20
        let btnImage = UIImage(named: "edit_profile")
        param.setImage(btnImage , for: UIControlState.normal)
        param.backgroundColor = UIColor(red:0, green:0.95, blue:0, alpha:1)
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let balance_label: UILabel =
    {
        let param = UILabel()
        param.text = "40.000"
        param.textColor = UIColor(red:0, green:0.75, blue:0, alpha:1)
        param.font = UIFont.boldSystemFont(ofSize: 40)
        param.font = UIFont(name:"Arial Rounded MT Bold", size: 40)
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        
        return param
        
    }()
    
    let currency_label: UILabel =
    {
        let param = UILabel()
        param.text = "AKZ"
        param.textColor = UIColor(red:0, green:0.75, blue:0, alpha:1)
        param.font = UIFont.boldSystemFont(ofSize: 20)
        param.font = UIFont(name:"Avenir Next Condensed", size: 20)
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let horizontal_bar: UIView =
    {
        let param = UIView()
        param.backgroundColor = UIColor(red:0.94, green:0.97, blue:1.00, alpha:1.0)

        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let transfers_textView: UITextView =
    {
        let param = UITextView()
        param.text = "AKZ"
        param.textColor = UIColor(red:0, green:0.75, blue:0, alpha:1)
        param.font = UIFont.boldSystemFont(ofSize: 20)
        param.font = UIFont(name:"Avenir Next Condensed", size: 20)
        
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let load_btn: UIButton =
    {
        let param = UIButton()
        param.setTitle("CASHOUT", for: UIControlState.normal)
        param.setTitleColor(UIColor.white, for: UIControlState.normal)
        param.backgroundColor = UIColor.lightGray
        
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let cashout_btn: UIButton =
    {
        let param = UIButton()
        param.setTitle("CARREGAR", for: UIControlState.normal)
        param.setTitleColor(UIColor.white, for: UIControlState.normal)
        param.backgroundColor = UIColor(red:0, green:0.75, blue:0, alpha:1)
        param.addTarget(self, action: #selector(handleLoadAccount), for: .touchUpInside)
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
    let pay_btn: UIButton =
    {
        let param = UIButton()
        param.setTitle("PAGAR", for: UIControlState.normal)
        param.setTitleColor(UIColor.white, for: UIControlState.normal)
        param.backgroundColor = UIColor.lightGray
        param.translatesAutoresizingMaskIntoConstraints = false
        return param
        
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:0.94, green:0.97, blue:1.00, alpha:1.0)
        
        
        view.addSubview(main_div)
        view.addSubview(user_profile_picture)
        view.addSubview(username_Label)
        view.addSubview(edit_profile_button)
        view.addSubview(balance_label)
        view.addSubview(currency_label)
        view.addSubview(horizontal_bar)
        view.addSubview(load_btn)
        view.addSubview(cashout_btn)
        view.addSubview(pay_btn)
        
        generate_codes()
        
        
        
        
        
        
        setupViews()
    }
    
    func setupViews() {
        main_div.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        main_div.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        main_div.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        main_div.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70).isActive = true
        
        user_profile_picture.topAnchor.constraint(equalTo: main_div.topAnchor, constant: 20).isActive = true
        user_profile_picture.heightAnchor.constraint(equalToConstant: 150).isActive = true
        user_profile_picture.widthAnchor.constraint(equalToConstant: 150).isActive = true
        user_profile_picture.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        edit_profile_button.rightAnchor.constraint(equalTo: user_profile_picture.rightAnchor).isActive = true
        edit_profile_button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        edit_profile_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        edit_profile_button.topAnchor.constraint(equalTo: main_div.topAnchor, constant: 20).isActive = true
        
        username_Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        username_Label.topAnchor.constraint(equalTo: user_profile_picture.bottomAnchor, constant: 10).isActive = true
        
        balance_label.topAnchor.constraint(equalTo: username_Label.bottomAnchor, constant: 10).isActive = true
        balance_label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        currency_label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currency_label.topAnchor.constraint(equalTo: balance_label.bottomAnchor, constant: 2).isActive = true
        
       
        horizontal_bar.widthAnchor.constraint(equalToConstant: 300).isActive = true
        horizontal_bar.topAnchor.constraint(equalTo: currency_label.bottomAnchor, constant: 10).isActive = true
        horizontal_bar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        horizontal_bar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        load_btn.topAnchor.constraint(equalTo: horizontal_bar.bottomAnchor, constant: 5).isActive = true
        load_btn.leftAnchor.constraint(equalTo: main_div.leftAnchor, constant: 5).isActive = true
        load_btn.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        cashout_btn.topAnchor.constraint(equalTo: horizontal_bar.bottomAnchor, constant: 5).isActive = true
        cashout_btn.centerXAnchor.constraint(equalTo: main_div.centerXAnchor).isActive = true
        cashout_btn.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
        pay_btn.topAnchor.constraint(equalTo: horizontal_bar.bottomAnchor, constant: 5).isActive = true
        pay_btn.rightAnchor.constraint(equalTo: main_div.rightAnchor, constant: -5).isActive = true
        pay_btn.widthAnchor.constraint(equalToConstant: 105).isActive = true
        
       
    }
    
    @objc func handleLoadAccount()
    {
        print("skdnsdnsld")
        view.addSubview(load_background_view)
        view.addSubview(load_form_view)
        load_form_view.addSubview(load_input_text_form)
        load_form_view.addSubview(load_input_button_form)
        
        load_background_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        load_background_view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        load_background_view.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        load_background_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        load_form_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        load_form_view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        load_form_view.widthAnchor.constraint(equalToConstant: 300).isActive = true
        load_form_view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        load_input_button_form.centerXAnchor.constraint(equalTo: load_form_view.centerXAnchor).isActive = true
        load_input_button_form.widthAnchor.constraint(equalToConstant: 130).isActive = true
        load_input_button_form.heightAnchor.constraint(equalToConstant: 30).isActive = true
        load_input_button_form.bottomAnchor.constraint(equalTo: load_form_view.bottomAnchor, constant: -10).isActive = true
        
        load_input_text_form.centerXAnchor.constraint(equalTo: load_form_view.centerXAnchor).isActive = true
        load_input_text_form.widthAnchor.constraint(equalToConstant: 130).isActive = true
        load_input_text_form.heightAnchor.constraint(equalToConstant: 30).isActive = true
        load_input_text_form.bottomAnchor.constraint(equalTo: load_input_button_form.topAnchor, constant: -40).isActive = true
        
        
        
    }
    
    @objc func dismiss_load_view()
    {
        print("De facto")
        load_background_view.translatesAutoresizingMaskIntoConstraints = true
        load_form_view.translatesAutoresizingMaskIntoConstraints = true
        self.reloadInputViews()
        
        
        
    }
    
    func generate_codes()
    {
        var uniqueNumbers: Set<Int64> = []
        
        for _ in 1...10000
        {
            let n1 = Int.random(in: 100...999)// do 101 998 (later)
            let n2 = 198 + (n1 % 100)
            let n3 = 100 + (n2 % 100)
            let n4 = Int.random(in: 100...999)
            let final_code_str = "" + String(n1) + "" + String(n2) + "" + String(n3) + "" + String(n4)
            let final_code = Int64(final_code_str)
            
            uniqueNumbers.insert(final_code!)
        }
            
        print(uniqueNumbers.count)
            
            
            /*
            for uniqueNumber in uniqueNumbers
            {
                print(uniqueNumber)
            
            
            }*/
            
            
            
            
        
    }
}
