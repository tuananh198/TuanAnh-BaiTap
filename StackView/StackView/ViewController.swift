//
//  ViewController.swift
//  StackView
//
//  Created by iOSTeam on 09/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var btFirst = UIButton()
    
    var lbFirst = UILabel()
    
    var tfFirst = UITextField()
    
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createBtFirst()
        createLbFirst()
        createStackView()
    }
    
    func createStackView() {
        view.addSubview(stackView)
        
        let viewA = UIView()
        viewA.backgroundColor = .red
        
        let viewB = UIView()
        viewB.backgroundColor = .blue
        
        stackView.addArrangedSubview(viewA)
        stackView.addArrangedSubview(viewB)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: lbFirst.bottomAnchor, constant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    func createBtFirst() {
        view.addSubview(btFirst)
        
        btFirst.translatesAutoresizingMaskIntoConstraints = false
        
        btFirst.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        btFirst.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        btFirst.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        btFirst.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        btFirst.backgroundColor = .red
        btFirst.setTitleColor(.white, for: .normal)
        btFirst.setTitle("Hello", for: .normal)
    }
    
    func createLbFirst() {
        view.addSubview(lbFirst)
        
        lbFirst.translatesAutoresizingMaskIntoConstraints = false
        
        lbFirst.topAnchor.constraint(equalTo: btFirst.bottomAnchor, constant: 50).isActive = true
        lbFirst.leadingAnchor.constraint(equalTo: btFirst.leadingAnchor).isActive = true
        lbFirst.trailingAnchor.constraint(equalTo: btFirst.trailingAnchor).isActive = true
        lbFirst.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lbFirst.text = "This is Label"
        lbFirst.backgroundColor = .blue
        lbFirst.textColor = .white
        lbFirst.textAlignment = .center
    }
    
}

