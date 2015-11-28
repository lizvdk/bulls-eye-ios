//
//  ViewController.swift
//  BullsEye
//
//  Created by Liz Vanderkloot on 11/26/15.
//  Copyright © 2015 lizvdk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
    
        score += points
    
        let message = "The value of the slider is: \(currentValue)"
                    + "\nThe target value was: \(targetValue)"
                    + "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(  title: "You scored \(points) points",
                                        message: message,
                                        preferredStyle: .Alert)
        
        let action = UIAlertAction(     title: "OK", style: .Default,
                                        handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

