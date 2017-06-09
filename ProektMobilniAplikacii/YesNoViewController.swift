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
    @IBOutlet weak var outl: UIButton!
    @IBOutlet weak var YesNoLabel: UILabel!
    
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    var choise : Int = 1 //2 - Yes | 1 - No
    var position : Int = 2 //2 - Yes | 1 - No
    
    @IBAction func PickButtonIsPressed(_ sender: Any) {
        outl.isHidden=true
        self.like0.isHidden=false
        YesNoLabel.text=""
        
        choise = Int(arc4random_uniform(2)) + 1
        if (choise == 2) { //Yes
            if (position == 2) { //full circle
                for _ in 0...3 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.like0.transform = self.like0.transform.rotated(by: CGFloat(Double.pi))
                    })
                }
            } else {
                for _ in 0...2 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.like0.transform = self.like0.transform.rotated(by: CGFloat(Double.pi))
                    })
                }
            }
            self.YesNoLabel.text = "Yes!!"
            position = 2
        } else { //No
            if (position == 1) { //full circle
                for _ in 0...3 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.like0.transform = self.like0.transform.rotated(by: CGFloat(Double.pi))
                    })
                }
            } else {
                for _ in 0...2 {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.like0.transform = self.like0.transform.rotated(by: CGFloat(Double.pi))
                    })
                }
            }
            self.YesNoLabel.text = "No!!"
            position = 1
        }
        self.outl.isHidden=false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Yes/No"
        
        YesNoLabel.text=""
//        likegif.loadGif(name: "likegifspeed")
        self.view.backgroundColor=UIColor.gray
        like0.isHidden=false
        self.outl.isHidden=false
        position = 2
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
