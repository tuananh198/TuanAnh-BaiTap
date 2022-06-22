//
//  UserView.swift
//  CustomView
//
//  Created by iOSTeam on 11/06/2022.
//

import UIKit

class UserView: UIView {

    var count = 0
    var delegate: UserViewDelegate?
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    /*
     
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func click_button(_ sender: Any) {
        count += 1
        nameLabel.text = "\(count)"
        if let delegate = delegate {
            delegate.didTap(view: self, count: count)
        }
    }
    
}

protocol UserViewDelegate {
    func didTap(view: UserView, count: Int)
}
