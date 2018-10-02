//
//  AddressViewController.swift
//  Reporter
//
//  Created by David Bowles on 17/09/2018.
//  Copyright © 2018 David Bowles. All rights reserved.
//

import UIKit
import RealmSwift


class LocationViewController: UITableViewController {

   let realm = try! Realm()
    
    
    var address: Results<Address>?
    
    var selectedClient: Client? {
       
        didSet {
            loadClient()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(CustomLocationTableViewCell.self, forCellReuseIdentifier: "locationCell")
         //print (selectedClient)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as! CustomLocationTableViewCell
        if let item = address?[indexPath.row].street {
           cell.street = item
        }
        if let item = address?[indexPath.row].town{
            cell.town = item
        }
        if let item = address?[indexPath.row].postcode{
            cell.postcode = item
        }
        if let item = address?[indexPath.row].country{
            cell.country = item
        }
        cell.layoutSubviews()
        
        return cell
    }
//
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = address?.count {
            print(count)
            return count
        } else {
            print("zero rows")
        return 1
        }
    }

    
   
   
    @IBAction func NewAddressPressed(_ sender: UIBarButtonItem) {

        
        
        let alert = UIAlertController(title: "Add New Address", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Address", style: .default) { (action) in
            //Code here for what happens when button presssed
            if let currentClient = self.selectedClient {
                print("current client saved")
                do {
                    try self.realm.write {
                        let streetTxt = alert.textFields![0]
                        let townTxt = alert.textFields![1]
                        let postcodeTxt = alert.textFields![2]
                        let countryTxt = alert.textFields![3]
                        
                        let newAddress = Address()
                        newAddress.street = streetTxt.text!
                        newAddress.town = townTxt.text!
                        newAddress.postcode = postcodeTxt.text!
                        newAddress.country = countryTxt.text!
                        currentClient.addresses.append(newAddress)
                    }
        
                } catch {
                    print ("Error saving address, \(error)")
                        
                    }
                }
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (textField :UITextField) in
            textField.placeholder = "Enter Street"
            
        }
        
        alert.addTextField { (textField :UITextField) in
            textField.placeholder = "Enter Town"
            
        }
        alert.addTextField { (textField :UITextField) in
            textField.placeholder = "Enter Postcode"
            
        }
        
        alert.addTextField { (textField :UITextField) in
            textField.placeholder = "Country"
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
        
  
    
   
//MARK - Save Address

func saveAddress(address: Address) {
    
    do {
        try realm.write {
            realm.add(address)
        }
    } catch {
        print("Error saving client \(error)")
    }
    
    tableView.reloadData()
    
}
    
    
    func loadClient() {
        
        address = selectedClient?.addresses.sorted(byKeyPath: "street", ascending: true)
       
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

}
