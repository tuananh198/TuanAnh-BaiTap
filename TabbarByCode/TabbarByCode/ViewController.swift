//
//  ViewController.swift
//  TabbarByCode
//
//  Created by iOSTeam on 16/06/2022.
//

import UIKit

class ViewController: UIViewController, UITabBarControllerDelegate {

    var button = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .white
        button.center = view.center
        button.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }
    
    @objc func didTap() {
        let vc1 = FirstViewController()
        let vc1Navi = UINavigationController(rootViewController: vc1)
        vc1.title = "Home!"
        let vc2 = SecondViewController()
        let vc2Navi = UINavigationController(rootViewController: vc2)
        vc2.title = "Account"
        
        let midVC = UINavigationController(rootViewController: MiddleViewController())
        midVC.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icon-search"), tag: 1)
        //tabBarItem.imageInsets = UIEdgeInsets(top: 85, left: 85, bottom: 85, right: 85)
        
        let tabbarVC = UITabBarController()
        tabbarVC.tabBar.tintColor = .white
        tabbarVC.tabBar.backgroundColor = .systemPink
        tabbarVC.tabBar.unselectedItemTintColor = .black
        
        tabbarVC.setViewControllers([vc1Navi, midVC, vc2Navi], animated: true)
        tabbarVC.modalPresentationStyle = .fullScreen
        
        present(tabbarVC, animated: true)
    }
    
}

class FirstViewController: UIViewController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.tabBarController?.delegate = self
    }
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Selected: \(tabBarController.selectedIndex)")
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
}

class MiddleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
