//
//  ViewController.swift
//  NavigationController
//
//  Created by iOSTeam on 07/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldMan1: UITextField!
    @IBAction func goToXanhClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let manhinh2 = sb.instantiateViewController(withIdentifier: "MauXanh") as! MauXanhViewController
        manhinh2.textFromMan1 = textFieldMan1.text
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Man 1: View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Man 1: View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Man 1: View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Man 1: View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Man 1: View Did Disappear")
    }


}

