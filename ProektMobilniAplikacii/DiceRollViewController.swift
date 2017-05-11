//
//  DiceRollViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class DiceRollViewController: UIViewController {
    
    var dice : Int = 0
    
    @IBOutlet weak var DiceRollLabel: UILabel!
    @IBAction func RollButtonIsPressed(_ sender: Any) {
        dice = Int(arc4random_uniform(6))
        DiceRollLabel.text = String (dice + 1)
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
