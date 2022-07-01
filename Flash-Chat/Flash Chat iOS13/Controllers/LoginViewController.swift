//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                    let loginFailed = UIAlertController(title: "Login Failed", message: e.localizedDescription, preferredStyle: .alert)
                    loginFailed.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self?.present(loginFailed, animated: true)
                } else {
                    let chatcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chat")
                    self?.navigationController?.pushViewController(chatcontroller, animated: false)
                }
            }
        }
        
    }
    
}
