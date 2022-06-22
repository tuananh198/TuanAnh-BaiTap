//
//  MyCustomView.swift
//  CustomView
//
//  Created by iOSTeam on 10/06/2022.
//

import UIKit

class MyCustomView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var avaterUser: UIImageView?
    var nameUser: UILabel?
    var btn: UIButton?
    var count = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        avaterUser = UIImageView(image: UIImage(named: "default"))
        avaterUser?.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height*4/5)
        self.addSubview(avaterUser!)
        
        nameUser = UILabel(frame: CGRect(x: 0, y: frame.size.height*4/5, width: frame.size.width, height: frame.size.height/5))
        nameUser?.text = "UserName"
        nameUser?.textColor = .blue
        nameUser?.backgroundColor = .gray
        nameUser?.textAlignment = .center
        self.addSubview(nameUser!)
        
        btn = UIButton(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        btn?.addTarget(self, action: #selector(click_btn), for: .touchUpInside)
        self.addSubview(btn!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func click_btn() {
        count = count + 1
        nameUser?.text = "\(count)"
    }
    
    
}

