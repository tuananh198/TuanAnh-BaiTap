//
//  HomeViewController.swift
//  TableViewFx
//
//  Created by iOSTeam on 14/06/2022.
//

import UIKit

class HomeViewController: UIViewController {

    var names: [[String]] =
            [
                ["IPhone 11", "IPhone 12"],
                ["Samsung Galaxy S22", "Galaxy Z Flip"]
        ]
    var titles = ["Ios", "Android"]
    var prices = [["1000$", "2000$"], ["3000$", "4000$"]]
    var device: [Device] = [Device(deviceName: "IPhone 11", devicePrice: "1000$"), Device(deviceName: "IPhone 12", devicePrice: "1400$")]
    var deviceAndroid: [Device] = [Device(deviceName: "Galaxy Z Fold 3", devicePrice: "2000$")]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return device.count
        }
        else if section == 1 {
            return deviceAndroid.count
        }
        else {
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        if indexPath.section == 0 {
            cell.nameDevice.text = device[indexPath.row].deviceName
            cell.descDevice.text = device[indexPath.row].devicePrice
        }
        else if indexPath.section == 1 {
            cell.nameDevice.text = deviceAndroid[indexPath.row].deviceName
            cell.descDevice.text = deviceAndroid[indexPath.row].devicePrice
        }
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(device[indexPath.row].deviceName)")
        let vc = DetailViewController()
        vc.label.text =  device[indexPath.row].deviceName
        self.navigationController?.pushViewController(vc, animated: true)
                
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
}
