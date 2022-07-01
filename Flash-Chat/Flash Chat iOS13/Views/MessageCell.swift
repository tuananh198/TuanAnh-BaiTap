//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by iOSTeam on 29/06/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var messageBody: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height/5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func rightToLeftSemantic() {
        stackView.semanticContentAttribute = .forceRightToLeft
    }
    
    func leftToRightSemantic() {
        stackView.semanticContentAttribute = .forceLeftToRight
    }
    
    func changeColorMessege(color: UIColor) {
        messageBubble.backgroundColor = color
    }
    
    func styleMessegeBubble(color: UIColor, textColor: UIColor, semanticAtt: UISemanticContentAttribute) {
        messageBubble.backgroundColor = color
        messageBody.textColor = textColor
        stackView.semanticContentAttribute = semanticAtt
    }
    
}
