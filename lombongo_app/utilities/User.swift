//
//  Login.swift
//  lombongo_app
//
//  Created by Mauro Benedito on 06/09/18.
//  Copyright © 2018 Mauro Benedito. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class Login {
    var email: String
    var senha: String!
    
    init(email: String, password: String)
    {
        self.email = email
        self.senha = password
    }
    
    enum AuthResult {
        case success(Bool), failure(Error)
    }
    
    func executeLogin(completion: @escaping (AuthResult) -> ()) {
        
    
        
    }
    
    
    
}

class Register {
    var success = Int()
    var email: String
    var name: String
    var username: String
    var senha: String
    var phonenumber: Int
    var iban: Int
    var balance: Int
    
    init(email: String, username: String, senha: String, name: String, phonenumber: Int, iban: Int, balance:Int) {
        self.email = email
        self.username = username
        self.senha = senha
        self.name = name
        self.phonenumber = phonenumber
        self.iban = iban
        self.balance = balance
        
    }

    
    enum AuthResult {
        case success(Bool), failure(Error)
    }
    
    
    func registerUser(completion: @escaping (AuthResult) -> ()) {
        
        Auth.auth().createUser(withEmail: self.email, password: self.senha) { (user, err) in
            
            if let error = err
            {
                print("Algo deu errado: ", error)
                completion(.failure(error))
                return
            }
            
            print("User entrou: ", user?.user.uid ?? "")
            completion(.success(true))
            
            guard let uid = user?.user.uid else { return }
            
            
            let userValues = ["fullname":self.name, "username": self.username, "email":self.email, "phonenumber": self.phonenumber, "balance": self.balance] as [String : Any]
            
            let values = [uid: userValues]
            
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let erro = err
                {
                    print("Failed to save user info into db: ", erro)
                    completion(.failure(erro))
                    
                    return
                }
                
                print("Successfully saved user info to db")
                completion(.success(true))
         
            })
            
        }
    
        
    }
    
    func login_user(completion: @escaping (AuthResult) -> ()) {
        
        Auth.auth().createUser(withEmail: self.email, password: self.senha) { (user, err) in
            
            if let error = err
            {
                print("Algo deu errado: ", error)
                completion(.failure(error))
                return
            }
            
            print("User entrou: ", user?.user.uid ?? "")
            completion(.success(true))
            
            guard let uid = user?.user.uid else { return }
            
            
            let userValues = ["fullname":self.name, "username": self.username, "email":self.email, "phonenumber": self.phonenumber] as [String : Any]
            let values = [uid: userValues]
            
            Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
                if let erro = err
                {
                    print("Failed to save user info into db: ", erro)
                    completion(.failure(erro))
                    
                    return
                }
                
                print("Successfully saved user info to db")
                completion(.success(true))
                
            })
            
        }
        
        
    }
    
    private func registerUserNetworkRequest(completionHandler:@escaping (Int, Error?)->()) -> Void
    {
        
       /*
        let parameters = "email="+self.email+"&username="+self.username+"&password="+self.senha+"&fullname="+self.name
        
        var request = URLRequest(url: NSURL(string: "http://localhost/lombongo/APIS/register_user.php")! as URL)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = parameters.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                
                print("error=\(String(describing: error))")// usar a funcao de erro e mudar txt da label para a variavel error
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)as? [String:Any]
                
                //self.success = Int((json!["success"] as! NSString).intValue) // WAnt to return this value!
                completionHandler(Int((json!["success"] as! NSString).intValue), nil)
                
                DispatchQueue.main.async {
                    
                }
            }catch
            {
                completionHandler(0, error)
                print(error)
            }
        }
        
         task.resume()
        
         
         
         */
        
        
    }
    
}
