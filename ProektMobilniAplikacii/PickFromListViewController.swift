//
//  PickFromListViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class PickFromListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CellButtonPressed {
    
    var choise : Int = 0
    var list : [String] = []
    
    @IBOutlet weak var insertItemTextField: UITextField!
    @IBOutlet weak var itemListTableView: UITableView!
    @IBOutlet weak var pickedItemLabel: UILabel!
    
    @IBAction func insertItemButtonIsPressed(_ sender: Any) {
        list.append(insertItemTextField.text!)
        itemListTableView.reloadData()
        insertItemTextField.text = ""
    }
    
    @IBAction func pickOneButtonIsPressed(_ sender: Any) {
        let random = arc4random_uniform(UInt32(list.count))
        pickedItemLabel.text = list[Int(random)]
        self.insertItemTextField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func didPressCellButton(_ sender: Any) {
        
    }
    
    func deleteCell (cell: UITableViewCell) {
        let deletionIndexPath = itemListTableView.indexPath(for: cell)
        itemListTableView.deleteRows(at: [deletionIndexPath!], with: .automatic)
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.itemListTableView.dequeueReusableCell(withIdentifier: "PickFromListIdentifier") as! PickFromListTableViewCell
        cell.delegate = self
        cell.itemLabel.text = list[indexPath.row]
        cell.myTableViewController = self
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemListTableView.delegate = self
        self.itemListTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
