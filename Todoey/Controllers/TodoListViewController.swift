//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    var itemArray = [ Item ]()
    
    
    var revisedItemArray: [ Item ] = [Item.init(title: "go"),
                                      Item.init(title: "Lets get it"),
                                      Item.init(title: "Testing"),
                                      Item.init(title: "Bread")
    ]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newItem = Item()
        newItem.title = "Find mike"
        itemArray.append(newItem)
        
        var newItem2 = Item()
        newItem2.title = "Breads"
        itemArray.append(newItem2)
        
        var newItem3 = Item()
        newItem3.title = "Lets get it"
        itemArray.append(newItem3)
        
        var newItem4 = Item()
        newItem4.title = "yeet"
        itemArray.append(newItem4)
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }

        
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
    
        
        //if itemArray[indexPath.row][1] as! Int  == 0 {
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Item?", message: "", preferredStyle: .alert)
        
        var textField = UITextField()
        
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }

        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            //what will happen once user clicks add item
            print("success")
            
            if textField.text! == "" {
                textField.placeholder = "Entry cannot be empty..."
                self.present(alert, animated: true, completion: nil)
            } else {
                
                var newItem = Item()
                newItem.title = textField.text!
                self.itemArray.append(newItem)
                
               // self.itemArray.append([textField.text!, 0])
//                self.itemArray.append(textField.text!)
                self.defaults.set(self.itemArray, forKey: "TodoListArray")
            }
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}




