//
//  MoreOptionsViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Ljubomir Jankovikj on 6/19/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController
import CoreData


class MoreOptionsViewController: UIViewController {
    
    @IBAction func Button(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }

    @IBOutlet weak var soundSwitch: UISwitch!
    @IBAction func soundChanged(_ sender: Any) {
        //soundSwitch.isOn
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="More"
        // Do any additional setup after loading the view.
        
        //check for sound
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
