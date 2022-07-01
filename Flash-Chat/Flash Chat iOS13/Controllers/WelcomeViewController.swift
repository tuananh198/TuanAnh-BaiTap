//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //fakeAnimationTitle()
        animationUsingLib()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        let loginController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "login")
        navigationController?.pushViewController(loginController, animated: true)
    }
    @IBAction func registerClicked(_ sender: Any) {
        let registerController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "register")
        self.navigationController?.pushViewController(registerController, animated: true)
    }
    
    func fakeAnimationTitle() {
        titleLabel.text = ""
        let title = "⚡️FlashChat"
        var numOfChar = 0
        for char in title {
            numOfChar += 1
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(numOfChar), repeats: false) { (timer) in
                self.titleLabel.text!.append(char)
            }
        }
    }
    func animationUsingLib() {
        titleLabel.text = "⚡️FlashChat"
        //titleLabel.charInterval = 0.9
    }
}
