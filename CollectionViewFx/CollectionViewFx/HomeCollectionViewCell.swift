//
//  HomeCollectionViewCell.swift
//  CollectionViewFx
//
//  Created by iOSTeam on 15/06/2022.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var nameUser: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nameUser.textAlignment = .center
    
    }

}
