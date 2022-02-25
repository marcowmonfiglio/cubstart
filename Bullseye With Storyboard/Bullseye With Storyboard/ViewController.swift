//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        var tolerance = 0
        var answer = true
        if exactSwitch.isOn == false {
            tolerance = 10
        }
        if abs(Int(numSlider.value) - randomNumber) <= tolerance {
            answer = true
            
        } else {
            answer = false
        }
        
        if answer {
            resultLabel.text = "Bullseye! Level Up!"
            levelUp()
            
            
        } else {
            resultLabel.text = "Better luck next time! Play Again!"
            resultLabel.isHidden = false
            playAgainButton.isHidden = false
        }
        
        
    }
    
    @IBAction func playAgain(_ sender: Any) {
        updateVars(reset: true)
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        let roundVal = Int(numSlider.value)
        print(roundVal)
    }
    
    
    var randomNumber = 0
    var range = 100
    var level = 1
    var highScoreNum = 0
    
    func updateVars(reset: Bool) {
        if reset {
            highestScore()
            range = 100 //part of reset
            level = 1 //part of reset
            numSlider.maximumValue = Float(range)
        }
        rangeLabel.text = String(range) //general update
        currentLevel.text = String(level) //general update
        numSlider.value = Float(range/2) //general update
        randomNumber = Int(arc4random_uniform(101)) //general update
        numLabel.text = String(randomNumber) //general update
    }
    func highestScore() {
        if level > highScoreNum {
            highScoreNum = level
            highScore.text = String(highScoreNum)
        }
    }
    
    
    func levelUp() {
        range += 20
        level += 1
        numSlider.maximumValue = Float(range)
        updateVars(reset: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateVars(reset: true)
    }

}

