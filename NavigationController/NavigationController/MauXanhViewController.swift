//
//  MauXanhViewController.swift
//  NavigationController
//
//  Created by iOSTeam on 07/06/2022.
//

import UIKit

class MauXanhViewController: UIViewController {

    @IBOutlet weak var textFieldMan2: UITextField!
    var textFromMan1:String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Man 2: View Did Load")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textFieldMan2.text = textFromMan1
        print("Man 2: View Will Appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Man 2: View Did Appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Man 2: View Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("Man 2: View Did Disappear")
    }
    
    @IBAction func goToDoClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let manhinh3 = sb.instantiateViewController(withIdentifier: "MauDo")
        
        self.navigationController?.pushViewController(manhinh3, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
