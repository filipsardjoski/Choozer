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
    
    @IBOutlet weak var like0: UIImageView!
    @IBOutlet weak var like180: UIImageView!
    @IBOutlet weak var likegif: UIImageView!
    @IBOutlet weak var outl: UIButton!
    @IBOutlet weak var YesNoLabel: UILabel!
    
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    var choise : Int = 0 //0 - Yes | 1 - No
    
    
    @IBAction func PickButtonIsPressed(_ sender: Any) {
        outl.isHidden=true
        self.like180.isHidden=true
        self.likegif.isHidden=false
        self.like0.isHidden=true
        YesNoLabel.text=""
        
        
        choise = Int(arc4random_uniform(2))
        if (choise == 0) { //Yes
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // do after 1.5s
                self.likegif.isHidden=true
                self.like0.isHidden=false
                self.like180.isHidden=true
                self.YesNoLabel.text = "Yes!!"
                self.outl.isHidden=false
            }
        } else { //No
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                // do after 1.5s
                self.likegif.isHidden=true
                self.like180.isHidden=false
                self.like0.isHidden=true
                self.YesNoLabel.text = "No!!"
                self.outl.isHidden=false
            }
            
            
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Yes/No"
        
        YesNoLabel.text=""
        likegif.loadGif(name: "likegifspeed")
        self.view.backgroundColor=UIColor.gray
        like0.isHidden=false
        like180.isHidden=true
        likegif.isHidden=true

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
