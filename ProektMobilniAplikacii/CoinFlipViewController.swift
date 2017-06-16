//
//  CoinFlipViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController
import AVFoundation


class CoinFlipViewController: UIViewController {
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
        

    }
    
    @IBOutlet weak var gifce: UIImageView!
    @IBOutlet weak var heads: UIImageView!
    @IBOutlet weak var tails: UIImageView!
    
    @IBOutlet weak var CoinFlipLabel: UILabel!
    @IBOutlet weak var outl: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    
    var coin : Int = 0 //0 - Heads | 1 - Tails
    
    
    @IBAction func FlipButtonIsPressed(_ sender: Any) {
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "coinflip", ofType: "wav")!)
        
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        // Play the sound
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
        } catch _{
        }
        
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        
        
        
        outl.isHidden=true
        self.heads.isHidden=true
        self.tails.isHidden=true
        self.gifce.isHidden=false
        coin = Int(arc4random_uniform(2))
        CoinFlipLabel.text=""
       
        
        
      
        
        
        
        
        
        if (coin == 0) { //Heads
            //CoinFlipLabel.text = "Heads"
            //self.heads.isHidden=true
            //self.tails.isHidden=true
            //self.gifce.isHidden=false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.78) {
                // do after 0.78s
                self.CoinFlipLabel.text = "Heads!!"
                self.gifce.isHidden=true
                self.heads.isHidden=false
                self.outl.isHidden=false
                
            }
            
        } else {
            //CoinFlipLabel.text = "Tails"
            //self.heads.isHidden=true
            //self.tails.isHidden=true
            //self.gifce.isHidden=false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.78) {
                // do after 0.78s
                self.CoinFlipLabel.text = "Tails!!"
                self.gifce.isHidden=true
                self.tails.isHidden=false
                self.outl.isHidden=false
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Coin flip"
        CoinFlipLabel.text=""
        self.view.backgroundColor = UIColor.black
        gifce.loadGif(name: "coin")
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
