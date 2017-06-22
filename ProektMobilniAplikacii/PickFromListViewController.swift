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
    @IBOutlet weak var lastPickedLabel: UILabel!
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    @IBOutlet weak var clearLastPick: UIButton!
    
    @IBAction func helpButtonTapped(_ sender: Any) {
        helpAlerts()
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
            let textFieldtext = alert?.textFields?[0].text!
            if (textFieldtext != "") {
                let newItem = NSEntityDescription.insertNewObject(forEntityName: "PickFromListItem", into: self.context)
                newItem.setValue(textFieldtext!, forKey: "itemName")
                do {
                    try self.context.save()
                } catch {
                    print ("Save Failed")
                }
            }
            self.tableViewController.reloadListData()
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        if (self.tableViewController.anyItems() == true) {
            let alert = UIAlertController(title: "Sure?", message: "If you click 'Yes' all items in the list will be deleted", preferredStyle: .alert)
            
            let yesAction = UIAlertAction (title : "Yes", style: .default) { (action: UIAlertAction!) in
                self.tableViewController.clearData()
            }
            
            let noAction = UIAlertAction (title: "No", style: .default, handler: nil)
            
            alert.addAction(yesAction)
            alert.addAction(noAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func decideButtonPressed(_ sender: Any) {
        if (self.tableViewController.anyItems() == true) {
            let chosenOne = self.tableViewController.getRandomItem()
            let alert = UIAlertController(title: "The chosen one is:", message: chosenOne, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Thank you!", style: .default, handler: nil))
        
            self.present(alert, animated: true, completion: nil)
            
            clearLastPick.isHidden = false
            UserDefaults.standard.set(chosenOne, forKey: "lastP")
            lastPickedLabel.text=UserDefaults.standard.string(forKey: "lastP")
            
        } else {
            let alert = UIAlertController(title: "Add some items first!", message: "", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Will do!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func clearLastPickLabelButtonPressed(_ sender: Any) {
        UserDefaults.standard.set("", forKey: "lastP")
        clearLastPick.isHidden = true
        lastPickedLabel.text=UserDefaults.standard.string(forKey: "lastP")
    }
    
    
    func helpAlerts () {
        let alert = UIAlertController(title: "Add items using the 'Add' button, then click Choose and I'll magicly select the chosen one from your list.", message: "", preferredStyle: .alert)
        
        let thanksAction = UIAlertAction (title: "Thanks!", style: .default) { (action: UIAlertAction!) in
            let secoundAlert = UIAlertController(title: "Also, you can swipe left on any item to delete it", message: "", preferredStyle: .alert)
            secoundAlert.addAction(UIAlertAction(title: "Thanks again!", style: .default, handler: nil))
            self.present(secoundAlert, animated: true, completion: nil)
        }

        alert.addAction(thanksAction)
        
        self.present(alert, animated: true, completion: nil)
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
            helpAlerts()
        }
        
        if (UserDefaults.standard.string(forKey: "lastP") == "") {
            clearLastPick.isHidden = true
        } else {
            clearLastPick.isHidden = false
        }
        lastPickedLabel.text=UserDefaults.standard.string(forKey: "lastP")
        
        
        
        // Do any additional setup after loading the view.
    }
}
