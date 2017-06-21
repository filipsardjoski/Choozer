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
        if (soundSwitch.isOn == true) { //Sound - ON - true
            UserDefaults.standard.setValue(true, forKey: "sound")
        } else { //Sound - OFF - false
            UserDefaults.standard.setValue(false, forKey: "sound")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="More"
        // Do any additional setup after loading the view.
        
        //check for sound
        if (UserDefaults.standard.value(forKey: "sound") as! Bool == true) { //Sound - ON
            soundSwitch.setOn(true, animated: false)
        } else { //Sound - OFF
            soundSwitch.setOn(false, animated: false)
        }
        
        let launchedMoreBefore = UserDefaults.standard.bool(forKey: "launchedMoreBefore")
        if launchedMoreBefore  {
            //Not first launch
            
        } else {
            //First launch
            UserDefaults.standard.set(true, forKey: "launchedPickFromListBefore")
            let alert = UIAlertController(title: "A quick tip:", message: "If you don't want to press the refresh button, simply shake your device ;)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Thanks!", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
