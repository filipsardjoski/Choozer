//
//  DiceRollViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController


class DiceRollViewController: UIViewController {
    
    @IBOutlet weak var segmentedPicker: UISegmentedControl!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var dice_2_1: UIImageView!
    @IBOutlet weak var dice_2_2: UIImageView!
    @IBOutlet weak var dice_1: UIImageView!
    
    var numberOfDice : Int = 1
    
    @IBAction func segmentedPickerPressed(_ sender: Any) {
        numberOfDice = segmentedPicker.selectedSegmentIndex + 1
        //RANDOMISE
        if (numberOfDice == 1) { //1 Die
            dice_2_1.isHidden = true
            dice_2_2.isHidden = true
            dice_1.isHidden = false
            let randomNumber = Int(arc4random_uniform(6)) + 1
            dice_1.image = UIImage (named: String("dice\(randomNumber)"))
        } else { //2 Dice
            dice_2_1.isHidden = false
            dice_2_2.isHidden = false
            dice_1.isHidden = true
            var randomNumber = Int(arc4random_uniform(6)) + 1
            dice_2_1.image = UIImage (named: String("dice\(randomNumber)"))
            randomNumber = Int(arc4random_uniform(6)) + 1
            dice_2_2.image = UIImage (named: String("dice\(randomNumber)"))
        }
    }
    
    @IBAction func rollDicePressed(_ sender: Any) {
        if (numberOfDice == 1) { //1 Die
            var randomNumber : Int = 0
            for _ in 1...10 {
                randomNumber = Int(arc4random_uniform(6)) + 1
            }
            resultLabel.text = "It's a \(randomNumber)"
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Double.pi
            rotationAnimation.duration = 0.2
            self.dice_1.layer.add(rotationAnimation, forKey: nil)
            
            dice_1.image = UIImage (named: String("dice\(randomNumber)"))
        } else { //2 Dice
            var randomNumber : Int = 0
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = Double.pi
            rotationAnimation.duration = 0.4
            self.dice_2_1.layer.add(rotationAnimation, forKey: nil)
            self.dice_2_2.layer.add(rotationAnimation, forKey: nil)
            
            for _ in 1...10 {
                randomNumber = Int(arc4random_uniform(6)) + 1
            }
            var temp = randomNumber
            dice_2_1.image = UIImage (named: String("dice\(randomNumber)"))
            for _ in 1...10 {
                randomNumber = Int(arc4random_uniform(6)) + 1
            }
            resultLabel.text = "It's a \(temp), and it's a \(randomNumber)"
            dice_2_2.image = UIImage (named: String("dice\(randomNumber)"))
        }
    }
    
    @IBAction func HamButtonPressed(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dice Roll"
        segmentedPicker.selectedSegmentIndex = 0
        numberOfDice = 1
        
        dice_2_1.isHidden = true
        dice_2_2.isHidden = true
        dice_1.isHidden = false
        let randomNumber = Int(arc4random_uniform(6)) + 1
        dice_1.image = UIImage (named: String("dice\(randomNumber)"))
        resultLabel.text = "It's a \(randomNumber)"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
