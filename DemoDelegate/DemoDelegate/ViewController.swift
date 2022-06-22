//
//  ViewController.swift
//  DemoDelegate
//
//  Created by iOSTeam on 13/06/2022.
//

import UIKit

class ViewController: UIViewController, chonNhanVienDelegate {
    func layThongTin(maNV: String, hoten: String) {
        txtMaNV.text = maNV
        txtHoTen.text = hoten
    }
    

    @IBOutlet weak var txtMaNV: UITextField!
    @IBOutlet weak var txtHoTen: UITextField!
    @IBAction func btnChonNhanVien(_ sender: Any) {
        let chonNhanVienController = storyboard?.instantiateViewController(withIdentifier: "choose") as! ChonNhanVienViewController
        chonNhanVienController.delegate = self
        present(chonNhanVienController, animated: true, completion: nil)
    }
    @IBAction func themNhanVien(_ sender: Any) {
        let chonNhanVienController = storyboard?.instantiateViewController(withIdentifier: "choose") as! ChonNhanVienViewController
        present(chonNhanVienController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

