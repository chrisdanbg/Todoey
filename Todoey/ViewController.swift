//
//  ViewController.swift
//  Todoey
//
//  Created by Kristyan Danailov on 25.06.18 г..
//  Copyright © 2018 г. Kristyan Danailov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemsArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        
        let newItem = Item()
        newItem.title = "Help Ivi"
        itemsArray.append(newItem)
        
//        if let items = defaults.array(forKey: "ItemsArray") as? [String] {
//            itemsArray = items
//        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem", for: indexPath)
        
        let item = itemsArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let item = itemsArray[indexPath.row]
        
        item.done = !item.done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }

    @IBAction func addButtonWasPressed(_ sender: Any) {
        
        var textToAppend = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default ) { (action) in
            
            let newItem = Item()
            newItem.title = textToAppend.text!
    
            self.itemsArray.append(newItem)
            print(self.itemsArray[0].title)
            //self.defaults.set(self.itemsArray, forKey: "SavedItems")
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (textField) in
            textField.placeholder = "Add new item here."
            textToAppend = textField
        }
        
        present(alert, animated: true, completion: nil)
    }
}

