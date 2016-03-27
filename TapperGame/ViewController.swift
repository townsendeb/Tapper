//
//  ViewController.swift
//  TapperGame
//
//  Created by Eric Townsend on 1/12/16.
//  Copyright © 2016 KrimsonTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapperLogo: UIImageView!
    @IBOutlet weak var enterText: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var clickToPlayImage: UIImageView!
    
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var tapLabel: UILabel!
    
    
    //Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    @IBAction func startGameButton(sender: UIButton) {
        
        
        if enterText.text != nil && enterText.text != ""{
            
           hideHomeScreen()
            
            maxTaps = Int(enterText.text!)!
            currentTaps = 0
            
            updateTapsLabel()
        }
    }

    @IBAction func onCoinTapped(sender: UIButton) {
        currentTaps++
       updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }

    func updateTapsLabel() {
        
         tapLabel.text = "\(currentTaps) Taps"
    }
    
    func isGameOver() -> Bool {
        if maxTaps <= currentTaps {
            return true
        } else {
            return false
        }
    }
    
    func hideHomeScreen () {
        
        tapperLogo.hidden = true
        enterText.hidden = true
        playButton.hidden = true
        clickToPlayImage.hidden = true
        
        tapButton.hidden = false
        tapLabel.hidden = false
        
    }
    
    func restartGame () {
        tapperLogo.hidden = false
        enterText.hidden = false
        playButton.hidden = false
        clickToPlayImage.hidden = false
        
        tapButton.hidden = true
        tapLabel.hidden = true
        
        maxTaps = 0
        enterText.text = ""
    }
}

