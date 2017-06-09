//
//  RockPaperScissorsViewController.swift
//  ProektMobilniAplikacii
//
//  Created by Filip Sardzoski on 3/21/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MMDrawerController

class RouletteViewController: UIViewController {
    
    @IBAction func HamButtonTapped(_ sender: Any) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.centerContainer!.toggle(MMDrawerSide.left, animated: true, completion: nil)
    }
    var blackNumbers = [10, 29, 8, 31, 6, 33, 4, 35, 2, 28, 26, 11, 20, 17, 22, 15, 24, 13]
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var colorView: UIImageView!
    @IBOutlet weak var roulette: UIImageView!
    
    @IBAction func pickButtonPressed(_ sender: Any) {
        
        colorView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
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
            colorView.backgroundColor = UIColor.green
            resultLabel.text = "00"
        } else if (randomNumber == 1) { //0
            colorView.backgroundColor = UIColor.green
            resultLabel.text = "0"
        } else { //number = randomNumber - 1
            let number = randomNumber - 1
            var isBlack = false
            for i in blackNumbers {
                if (number == i) { //black
                    colorView.backgroundColor = UIColor.black
                    resultLabel.text = String(number)
                    isBlack = true
                }
            }
            if (isBlack == false) {
                colorView.backgroundColor = UIColor.red
                resultLabel.text = String(number)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Roulette"
        
        colorView.backgroundColor = nil
        resultLabel.text = ""
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
