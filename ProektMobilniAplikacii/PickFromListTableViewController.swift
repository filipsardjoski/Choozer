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
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadListData()
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
        return listItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pickFromListCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = listItems[indexPath.row].itemName
        
        return cell
    }
    
    func reloadListData() {
        do {
            listItems = try context.fetch(PickFromListItem.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        tableView.reloadData()
    }
    
    func clearData () {
        for i in listItems {
            context.delete(i)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        do {
            listItems = try context.fetch(PickFromListItem.fetchRequest())
        }
        catch {
            print("Fetching Failed")
        }
        tableView.reloadData()
    }
    
    func getRandomItem () -> String {
        let temp = Int(arc4random_uniform(UInt32(listItems.count)))
        return listItems[temp].itemName!
    }
    
    func anyItems () -> Bool {
        if (listItems.count != 0) {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listItems.remove(at: indexPath.row)
            
            let item = listItems[indexPath.row]
            context.delete(item)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                listItems = try context.fetch(PickFromListItem.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
        }
        tableView.reloadData()
    }
    
}
