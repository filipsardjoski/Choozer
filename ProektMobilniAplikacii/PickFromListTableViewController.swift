//
//  PickFromListTableViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 6/20/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import CoreData

class PickFromListTableViewController: UITableViewController {

    
    var listItems : [PickFromListItem] = []
    var items : [String] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickFromListCell", for: indexPath)

        // Configure the cell...
        //cell.textLabel?.text = listItems[indexPath.row] as! String
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func reloadListData(temp : String) {
        items.append(temp)
        //CORE DATA PROBLEM
        /*
        do {
            listItems = try context.fetch(PickFromListItem.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        */
        tableView.reloadData()
    }
    
    func clearData () {
        items.removeAll()
        
        //ADD CORE DATA IMPLEMENTATION
        
        tableView.reloadData()
    }
    
    func getRandomItem () -> String {
        var temp = Int(arc4random_uniform(UInt32(items.count)))
        return items[temp]
    }
    
    func anyItems () -> Bool {
        if (items.count != 0) {
            return true
        }
        return false
    }
    
    //DELETE INDIVIDUAL CELLS
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            
            //CORE DATA PROBLEM
            /*
            let item = items[indexPath.row]
            context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                items = try context.fetch(Item.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
             */
        }
        tableView.reloadData()
    }
    
}
