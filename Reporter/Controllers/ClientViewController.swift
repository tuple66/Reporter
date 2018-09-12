//
//  ViewController.swift
//  Reporter
//
//  Created by David Bowles on 11/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import UIKit

class ClientViewController: UITableViewController {

    var clientArray = [Client]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return clientArray.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath)
        
        cell.textLabel?.text = clientArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Clients
    
    @IBAction func AddNewClientPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Client", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Client", style: .default) { (action) in
            //Code here for what happens when button presssed
          
            if let  textAdded = textField.text {
                if textAdded != "" {
                    self.clientArray.append(textAdded)
                }
                }
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Client"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

