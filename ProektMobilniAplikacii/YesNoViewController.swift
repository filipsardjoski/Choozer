//
//  YesNoViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController

class YesNoViewController: UIViewController {
    
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)    }
    
    var choise : Int = 0 //0 - Yes | 1 - No
    
    @IBOutlet weak var YesNoLabel: UILabel!
    @IBAction func PickButtonIsPressed(_ sender: Any) {
        choise = Int(arc4random_uniform(2))
        if (choise == 0) { //Yes
            YesNoLabel.text = "Yes"
        } else { //No
            YesNoLabel.text = "No"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
