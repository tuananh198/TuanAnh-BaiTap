//
//  DetailViewController.swift
//  TableViewFx
//
//  Created by iOSTeam on 14/06/2022.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var nameDevice: UILabel!
    var label = UILabel(frame: CGRect(x: 80, y: 150, width: 300, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        label.textColor = .systemPink
        label.textAlignment = .left
        view.addSubview(label)
        // Do any additional setup after loading the view.
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
