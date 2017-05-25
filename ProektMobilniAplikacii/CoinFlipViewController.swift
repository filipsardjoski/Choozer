//
//  CoinFlipViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController


class CoinFlipViewController: UIViewController {
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        

    }
    
    @IBOutlet weak var gifce: UIImageView!
    @IBOutlet weak var heads: UIImageView!
    @IBOutlet weak var tails: UIImageView!
    
    
    
    
    var coin : Int = 0 //0 - Heads | 1 - Tails
    
    @IBOutlet weak var CoinFlipLabel: UILabel!
    @IBAction func FlipButtonIsPressed(_ sender: Any) {
        coin = Int(arc4random_uniform(2))
        if (coin == 0) { //Heads
            CoinFlipLabel.text = "Heads"
            self.heads.isHidden=true
            self.tails.isHidden=true
            self.gifce.isHidden=false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // do after 1.5s
                self.gifce.isHidden=true
                self.heads.isHidden=false
                
            }
            
        } else {
            CoinFlipLabel.text = "Tails"
            self.heads.isHidden=true
            self.gifce.isHidden=false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // do after 1.5s
                self.gifce.isHidden=true
                self.tails.isHidden=false
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        gifce.loadGif(name: "he")
        gifce.isHidden=true
        heads.isHidden=false
        tails.isHidden=true
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
