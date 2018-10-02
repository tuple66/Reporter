//
//  ViewController.swift
//  Reporter
//
//  Created by David Bowles on 11/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import UIKit
import RealmSwift

class ClientViewController: UITableViewController {

    
    let realm = try! Realm()
    
    var clientArray: Results<Client>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        load()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return clientArray?.count ?? 1
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClientCell", for: indexPath)
        
        let client = clientArray?[indexPath.row]
        
        cell.textLabel?.text = client?.name ?? "No client Added Yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "showLocation", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LocationViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedClient = clientArray?[indexPath.row]
            
        }
    }
    
    //MARK - Add New Clients
    
    @IBAction func AddNewClientPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title: "Add New Client", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Client", style: .default) { (action) in
            //Code here for what happens when button presssed
          
            let newClient = Client()
            newClient.name = textField.text!
            
            self.saveClients(client: newClient)
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Client"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - Save Clients
    
    func saveClients(client: Client) {
        
        do {
            try realm.write {
                realm.add(client)
            }
          } catch {
            print("Error saving client \(error)")
            }
        
      tableView.reloadData()
    
    }
    
    
    //MARK - Load Clients
    
    func load () {
        
        clientArray = realm.objects(Client.self)
        tableView.reloadData()
        
    }
    
    
        
        
    }
    
    
    
    


