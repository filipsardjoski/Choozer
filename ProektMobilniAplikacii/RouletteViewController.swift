//
//  RockPaperScissorsViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController
import AVFoundation


class RouletteViewController: UIViewController {
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    var blackNumbers = [10, 29, 8, 31, 6, 33, 4, 35, 2, 28, 26, 11, 20, 17, 22, 15, 24, 13]
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var roulette: UIImageView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var buttonOutlet: UIButton!
    var audioPlayer = AVAudioPlayer()

    
    @IBAction func pickButtonPressed(_ sender: Any) {
        
        // Set the sound file name & extension
        let alertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Roule", ofType: "mp3")!)
        
        do {
            // Preperation
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
        } catch _ {
        }
        do {
            try AVAudioSession.sharedInstance().setActive(true)
        } catch _ {
        }
        
        if (UserDefaults.standard.value(forKey: "sound") as! Bool == true) { //Sound - ON
            // Play the sound
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: alertSound)
            } catch _{
            }
        
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
        
        buttonOutlet.isHidden=true
        startLabel.isHidden=true
        resultLabel.text=""
        
        colorView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        self.colorView.backgroundColor = UIColor.white
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0.5,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.colorView.transform = .identity
            }, completion: nil)
        
        UILabel.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.1,
                       initialSpringVelocity: 0.5,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.resultLabel.transform = .identity
            }, completion: nil)
        
        //roulette animation
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Double.pi
        rotationAnimation.duration = 1
        self.roulette.layer.add(rotationAnimation, forKey: nil)
        
        let randomNumber = Int(arc4random_uniform(38)) + 1
        
        if (randomNumber == 0) { //00
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.colorView.backgroundColor = UIColor.init(red: 0.10, green: 0.47, blue: 0.09, alpha: 1.0)
                self.resultLabel.text = "00"
                self.buttonOutlet.isHidden=false
            }

            
        } else if (randomNumber == 1) { //0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.colorView.backgroundColor = UIColor.init(red: 0.10, green: 0.47, blue: 0.09, alpha: 1.0)
                self.resultLabel.text = "0"
                self.buttonOutlet.isHidden=false
            }
            
        } else { //number = randomNumber - 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                        let number = randomNumber - 1
                        var isBlack = false
                        for i in self.blackNumbers
                        {
                            if (number == i)
                            { //black
                                //  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.colorView.backgroundColor = UIColor.black
                                self.resultLabel.text = String(number)
                                self.buttonOutlet.isHidden=false
                                isBlack = true
                                // }
                    
                            }
                        }
                if (isBlack == false)
                    {
                        //  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.colorView.backgroundColor = UIColor.red
                            self.resultLabel.text = String(number)
                            self.buttonOutlet.isHidden=false
                        // }
                
                        }
                    }
                }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Roulette"
        
        colorView.backgroundColor = nil
        startLabel.isHidden=false
        resultLabel.text = ""
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
