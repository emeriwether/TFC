//
//  RockScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class RockScene: SKScene {
    // local variables to keep track of touches for this scene
    var rock_incorrectTouches = 0
    var rock_correctTouches = 0
    var totalTouches = 0
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_rock", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        /////////////////////////////////
        ////// IDLE REMINDER TIMER //////
        /////////////////////////////////
        let oneSecTimer = SKAction.wait(forDuration: 1.0)
        var timerCount = 1
        var currentTouches = 0
        var totalTimerCount = 0
        
        // set up sequence for if the scene has not been touched for 10 seconds: play the idle reminder
        let reminderIfIdle = SKAction.run {
            self.reminderComplete = false
            let rock_reminder = SKAction.playSoundFileNamed("reminder_rock", waitForCompletion: true)
            self.run(rock_reminder, completion: { self.reminderComplete = true} )
        }
        
        // for every one second, do this action:
        let timerAction = SKAction.run {
            // if no touch...
            if (self.totalTouches - currentTouches == 0) {
                // ...timer progresses one second...
                timerCount += 1
                totalTimerCount += 1
            }
                // ... else if a touch...
            else {
                // ... increase touch count...
                currentTouches += 1
                // ... and start timer over...
                timerCount = 1
            }
            // if timer seconds are divisable by 20 and totalTimerCount is less than one minute...
            if (timerCount % 20 == 0) && totalTimerCount <= 58  {
                // ... play the reminder.
                self.run(reminderIfIdle)
            }
            // if idleReminer has played 3 times in a row, move on to next scene
            if totalTimerCount > 59 {
                self.sceneOver = true
            
                transitionScene (currentScene: self, sceneString: "LampScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for rock sprite
        let rock = self.childNode(withName: "rock_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if rock_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "LampScene", waitTime: 0, fadeTime: 2)
            }
            
            //If rock sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == rock?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                rock_correctTouches += 1
                numCorrectPerScene["rock"] = numCorrectPerScene["rock"]! + 1
                comboCompletedDict["twoItemSimple"] = comboCompletedDict["twoItemSimple"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide stats for first try
                if (rock_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    simpleCorrectFT += 1
                    twoItemCorrectFT += 1
                    correctFirstTries["rock"] = true
                    comboNumFTDict["twoItemSimple"] = comboNumFTDict["twoItemSimple"]! + 1
                }
                
                animateNode(node: rock!, coloredImg: "ballcolored", correctSound: "correct2")
                
                transitionScene (currentScene: self, sceneString: "LampScene", waitTime: 2.5, fadeTime: 1)
            }
            else {
                rock_incorrectTouches += 1
                numIncorrectPerScene["rock"] = numIncorrectPerScene["rock"]! + 1
                comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemSimple"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                rock?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (rock_incorrectTouches % 3 == 0) && rock_correctTouches < 1 && rock_incorrectTouches < 14 {
//                reminderComplete = false
//                let rock_reminder = SKAction.playSoundFileNamed("reminder_rock", waitForCompletion: true)
//                run(rock_reminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = rock_correctTouches + rock_incorrectTouches
    }
}
