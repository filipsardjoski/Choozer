//
//  PickFromListViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import CoreData
import Foundation
import MMDrawerController

class PickFromListViewController: UIViewController {
    
    var listItems : [PickFromListItem] = []
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tableViewController : PickFromListTableViewController! = nil
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PickFromListTableViewController, segue.identifier == "pickFromListEmbedSegue" {
            self.tableViewController = vc
        }
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add Item", message: "", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            //CORE DATA PROBLEM
            /*
            let textFieldtext = alert?.textFields?[0].text!
            if (textFieldtext != "") {
                let newItem = NSEntityDescription.insertNewObject(forEntityName: "PickFromListItem", into: self.context)
                newItem.setValue(textFieldtext! as! String, forKey: "itemName")
                do {
                    try self.context.save()
                } catch {
                    print ("Save Failed")
                }
                
            }
            */
            self.tableViewController.reloadListData(temp: (alert?.textFields?[0].text!)!)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        self.tableViewController.clearData()
    }
    
    
    @IBAction func decideButtonPressed(_ sender: Any) {
        if (self.tableViewController.anyItems() == true) {
            let chosenOne = self.tableViewController.getRandomItem()
            let alert = UIAlertController(title: "The chosen one is:", message: chosenOne, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
        
            self.present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Add some items first!", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Will do!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Pick from list"
        
        let launchedPickFromListBefore = UserDefaults.standard.bool(forKey: "launchedPickFromListBefore")
        if launchedPickFromListBefore  {
            //Not first launch
            
        } else {
            //First launch
            UserDefaults.standard.set(true, forKey: "launchedPickFromListBefore")
            let alert = UIAlertController(title: "Single items can be deleted by swiping left ;)", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        
        
        
        // Do any additional setup after loading the view.
    }
}
