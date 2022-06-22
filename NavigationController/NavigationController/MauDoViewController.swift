//
//  MauDoViewController.swift
//  NavigationController
//
//  Created by iOSTeam on 07/06/2022.
//

import UIKit

class MauDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backToPrevScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backtoRoot(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func backToView(_ sender: UIButton) {
        let manhinh2 = self.navigationController?.viewControllers[1] as! MauXanhViewController
        manhinh2.textFromMan1 = "Hâhhaa"
        self.navigationController?.popToViewController(manhinh2, animated: true)
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
