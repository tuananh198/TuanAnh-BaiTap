//
//  ViewController.swift
//  CustomView
//
//  Created by iOSTeam on 10/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myCustomView = MyCustomView(frame: CGRect(x: 50, y: 50, width: 100, height: 125))
        myCustomView.nameUser?.text = "This Test"
        
        let myCustomView2 = MyCustomView(frame: CGRect(x: 170, y: 50, width: 100, height: 125))
        
        myCustomView2.nameUser?.text = "Thay Giao Ba"
        myCustomView2.avaterUser?.image = UIImage(named: "baga")
        
        view.addSubview(myCustomView)
        view.addSubview(myCustomView2)
    }


}


