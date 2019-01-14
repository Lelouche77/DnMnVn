//
//  ViewController.swift
//  DMV
//
//  Created by Nauman Bajwa on 1/12/19.
//  Copyright © 2019 Nauman Bajwa. All rights reserved.
//

import UIKit

class answerOptionsViewController: UITableViewController {

    var answerOptionArray: Array = ["0.08", "0.04","0.02","0.01"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Mark: - Tableview data source methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerOptionArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerOptionCell", for: indexPath)
        cell.textLabel?.text = answerOptionArray[indexPath.row]
        return cell
    }
    // Mark: - Table view Delegate methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Cell number  \(indexPath.row)")
        print (answerOptionArray[indexPath.row])
        // selecting accessory type
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // to deselect the row
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    // Mark: add answer options clicked
    @IBAction func addOptions(_ sender: UIBarButtonItem) {
        var textFiled = UITextField()
        let alert = UIAlertController(title: "Add Answer option", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Option", style: .default) { (action) in
            // What will happen once the user clicks the addItem button on our UI Alert
            self.answerOptionArray.append(textFiled.text!)
            print("Success")
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Answer option."
            textFiled = alertTextField
          //  print(alertTextField.text)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

