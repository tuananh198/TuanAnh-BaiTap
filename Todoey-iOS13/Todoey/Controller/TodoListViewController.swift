//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    var itemArray = [Entity]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        mySearchBar.delegate = self
        print(dataFilePath)
        loadItem()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].taskName
        if itemArray[indexPath.row].complated == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if itemArray[indexPath.row].complated == true {
            itemArray[indexPath.row].complated = false
        } else {
            itemArray[indexPath.row].complated = true
        }
        self.tableView.reloadData()
        print(itemArray[indexPath.row])
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textFromAlertTextField = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textFromAlertTextField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            let newItem = Entity(context: self.context)
            newItem.taskName = textFromAlertTextField.text!
            newItem.complated = false
//            let model = TodoList(taskName: textFromAlertTextField.text!, complated: false)
            self.itemArray.append(newItem)
            self.saveItem()
//            self.defaults.set(self.itemArray, forKey: "TodoList")
            
        }
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    func saveItem() {
        do {
            try context.save()
        } catch {
            print(error)
        }
        self.tableView.reloadData()
    }
    
    func loadItem(request: NSFetchRequest<Entity> = Entity.fetchRequest()) {
        do {
            itemArray = try context.fetch(request)
            if itemArray.count == 0 {
                
            }
        } catch {
            print(error)
        }
    }
}

extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text != "" {
            searchInput(input: searchBar.text!)
        }
        tableView.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //print(searchText)
        if searchText != "" {
            searchInput(input: searchText)
        } else {
            loadItem()
        }
        tableView.reloadData()
    }
    
    func searchInput(input: String) {
        
        let request: NSFetchRequest<Entity> = Entity.fetchRequest()
        
        let predicate = NSPredicate(format: "taskName CONTAINS[cd] %@", input)

        request.predicate = predicate
        
        request.sortDescriptors = [NSSortDescriptor(key: "taskName", ascending: true)]
        
        loadItem(request: request)
    }
}


