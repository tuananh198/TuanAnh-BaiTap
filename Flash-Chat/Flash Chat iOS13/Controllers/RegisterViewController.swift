//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true)
                } else {
                    let succesAler = UIAlertController(title: "Success", message: "", preferredStyle: .alert)
                    succesAler.addAction(UIAlertAction(title: "Go to Home page", style: .default, handler: { (UIAlerAction) in
                        let welcomeController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcome")
                        self.navigationController?.pushViewController(welcomeController, animated: true)
                    }))
                    self.present(succesAler, animated: true)
                }
            }
        }
        

    }
    
}
