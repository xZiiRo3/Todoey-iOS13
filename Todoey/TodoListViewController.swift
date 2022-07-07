//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
//    var itemArray = [ ["Yeet", 0],
//                      ["lets get it", 0],
//                      ["send nudes", 1 ],
//                      ["Yeet", 0] ]
    
    
    var revisedItemArray: [ Item ] = [Item.init(title: "go"),
                                      Item.init(title: "Lets get it"),
                                      Item.init(title: "Testing"),
                                      Item.init(title: "Bread")
    ]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//            itemArray = items
//        }

        
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return revisedItemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = revisedItemArray[indexPath.row].title
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = message
    
        
        //if itemArray[indexPath.row][1] as! Int  == 0 {
        if revisedItemArray[indexPath.row].done == false {
            cell.accessoryType = .none
        }else{
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //print(itemArray[indexPath.row])
        
        //if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        if revisedItemArray[indexPath.row].done == false {
            //self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            revisedItemArray[indexPath.row].done = true
        }else{
            //self.tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            self.tableView.cellForRow(at: indexPath)?.accessoryType = .none
            revisedItemArray[indexPath.row].done = false
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.reloadData()
        
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
                self.revisedItemArray.append( Item.init(title: textField.text!) )
                
               // self.itemArray.append([textField.text!, 0])
//                self.itemArray.append(textField.text!)
//                self.defaults.set(self.itemArray, forKey: "TodoListArray")
            }
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}




