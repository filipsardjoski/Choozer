//
//  CoinFlipViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit


class CoinFlipViewController: UIViewController {
    
    var coin : Int = 0 //0 - Heads | 1 - Tails
    
    @IBOutlet weak var CoinFlipLabel: UILabel!
    @IBAction func FlipButtonIsPressed(_ sender: Any) {
        coin = Int(arc4random_uniform(2))
        if (coin == 0) { //Heads
            CoinFlipLabel.text = "Heads"
        } else {
            CoinFlipLabel.text = "Tails"
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
