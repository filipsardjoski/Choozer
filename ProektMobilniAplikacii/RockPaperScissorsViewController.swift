//
//  RockPaperScissorsViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class RockPaperScissorsViewController: UIViewController {
    
    var choise : Int = 0 //0 - Rock | 1 - Paper | Scissors
    
    
    @IBOutlet weak var RockPaperScissorsLabel: UILabel!
    @IBAction func PickButtonIsPressed(_ sender: Any) {
        choise = Int(arc4random_uniform(3))
        if (choise == 0) { //Rock
            RockPaperScissorsLabel.text = "Rock"
        } else if (choise == 1) { //Paper
            RockPaperScissorsLabel.text = "Paper"
        } else { //Scissors
            RockPaperScissorsLabel.text = "Scissors"
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
