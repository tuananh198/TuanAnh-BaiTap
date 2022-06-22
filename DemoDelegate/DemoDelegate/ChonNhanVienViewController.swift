//
//  ChonNhanVienViewController.swift
//  DemoDelegate
//
//  Created by iOSTeam on 13/06/2022.
//

import UIKit
protocol chonNhanVienDelegate {
    func layThongTin(maNV: String, hoten: String)
}
class ChonNhanVienViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listName = ["Ngô Tuấn Anh", "Nguyễn Văn A", "Nguyễn Văn B", "This test"]
    var listMa = ["001", "002", "003", "This test"]
    var delegate: chonNhanVienDelegate?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let myCell = tableView.dequeueReusableCell(withIdentifier: "cellNhanVien", for: indexPath)
        
        myCell.textLabel?.text = listMa[indexPath.row] + listName[indexPath.row]
        
        return myCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if delegate != nil {
            delegate?.layThongTin(maNV: listMa[indexPath.row], hoten: listName[indexPath.row])
            dismiss(animated: true, completion: nil)
        }
    }

    @IBOutlet weak var tableViewNhanVien: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewNhanVien.delegate = self
        tableViewNhanVien.dataSource = self
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
