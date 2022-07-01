//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let firebaseAuth = Auth.auth()
    
    let db = Firestore.firestore()
    
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        title = "Flashchat"
        addLogoutButton()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: ["sender" : messageSender, "message" : messageBody, "time" : Date().timeIntervalSinceReferenceDate]) { (error) in
                if let e = error {
                    print("Sending Fail: \(e)")
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""                    }
                }
            }
        }
    }
    
    func loadData() {
        db.collection("messages").order(by: "time").addSnapshotListener { (querySnapshot, err) in
            if let e = err {
                print("Get message fail: \(e)")
            } else {
                self.message = []
                for mess in querySnapshot!.documents {
                    if let mTime = mess.data()["time"] as? Double, let mSender = mess.data()["sender"] as? String, let mBody = mess.data()["message"] as? String {
                        let newMesseger = Message(sender: mSender, body: mBody, time: mTime)
                        self.message.append(newMesseger)
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.scrollToBottom()
                }
            }
        }
    }
    
    func scrollToBottom() {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        let pathToLastRow = IndexPath(row: lastRowIndex, section: 0)
        tableView.scrollToRow(at: pathToLastRow, at: .bottom, animated: true)
    }
    
    func addLogoutButton() {
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        logoutBarButtonItem.tintColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    @objc func logoutUser(){
        do {
          try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! MessageCell
        cell.messageBody.text = message[indexPath.row].body
        if SenderIsCurrentUser(message: message[indexPath.row]) == 0 {
            cell.styleMessegeBubble(color: UIColor(named: "BrandLightPurple")!, textColor: UIColor(named: "BrandPurple")!, semanticAtt: UISemanticContentAttribute(rawValue: 4)!)
        } else {
            cell.styleMessegeBubble(color: UIColor(named: "BrandPurple")!, textColor: UIColor(named: "BrandLightPurple")!, semanticAtt: UISemanticContentAttribute(rawValue: 3)!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func SenderIsCurrentUser(message: Message) -> Int {
        if message.sender == Auth.auth().currentUser?.email {
            return 1
        }
        return 0
    }
}
