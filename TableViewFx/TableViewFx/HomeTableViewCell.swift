//
//  HomeTableViewCell.swift
//  TableViewFx
//
//  Created by iOSTeam on 15/06/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var nameDevice: UILabel!
    @IBOutlet weak var descDevice: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var imageDevice: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = . blue
        imageDevice.image = UIImage(named: "default")
        addButton.setTitleColor(.white, for: .normal)
        // Configure the view for the selected state
    }
    @IBAction func addButton_clicked(_ sender: Any) {
        print("Clicked Device: \(String(describing: nameDevice.text))")
        let vc = DetailViewController()
        
        
        
    }
    
}
