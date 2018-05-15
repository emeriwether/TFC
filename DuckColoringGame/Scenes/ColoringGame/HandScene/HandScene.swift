//
//  HandScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class HandScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var hand_incorrectTouches = 0
    var hand_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_hand", waitForCompletion: true)
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
            let hand_reminder = SKAction.playSoundFileNamed("reminder_hand", waitForCompletion: true)
            self.run(hand_reminder, completion: { self.reminderComplete = true} )
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
                
                transitionScene (currentScene: self, sceneString: "RainScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for hand sprite
        let hand = self.childNode(withName: "hand_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if hand_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "RainScene", waitTime: 0, fadeTime: 2)
            }
            
            //If hand sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == hand?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                hand_correctTouches += 1
                numCorrectPerScene["hand"] = numCorrectPerScene["hand"]! + 1
                comboCompletedDict["fourItemSimple"] = comboCompletedDict["fourItemSimple"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (hand_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    simpleCorrectFT += 1
                    fourItemCorrectFT += 1
                    correctFirstTries["hand"] = true
                    comboNumFTDict["fourItemSimple"] = comboNumFTDict["fourItemSimple"]! + 1
                }
                
                // play correct wiggleOnly animation (function declared on HandScene.swift in coloring game)
                wiggleOnly(node: hand!, coloredImg: "handScene_hand_colored", correctSound: "hand")
                
                transitionScene (currentScene: self, sceneString: "RainScene", waitTime: 2.5, fadeTime: 1)
            }
            else {
                hand_incorrectTouches += 1
                numIncorrectPerScene["hand"] = numIncorrectPerScene["hand"]! + 1
                comboNumIncorrectDict["fourItemSimple"] = comboNumIncorrectDict["fourItemSimple"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                hand?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (hand_incorrectTouches % 3 == 0) && hand_correctTouches < 1 && hand_incorrectTouches < 14 {
//                reminderComplete = false
//                let hand_reminder = SKAction.playSoundFileNamed("reminder_hand", waitForCompletion: true)
//                run(hand_reminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = hand_correctTouches + hand_incorrectTouches
    }
}

// animation for wiggleOnly (moon & hand): color, play sound, wave left and right
func wiggleOnly(node: SKNode, coloredImg: String, correctSound: String) {
    // Change sprite to colored node
    let coloredNode:SKTexture = SKTexture(imageNamed: coloredImg)
    let changeToColored:SKAction = SKAction.animate(with: [coloredNode], timePerFrame: 0.0001)
    node.run(changeToColored)
    
    // Variables for correct audio
    let correct = SKAction.playSoundFileNamed(correctSound, waitForCompletion: true)
    
    // Variables for wiggle animation
    let rotR = SKAction.rotate(byAngle: 0.20, duration: 0.3)
    let rotL = SKAction.rotate(byAngle: -0.20, duration: 0.3)
    let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
    let wiggle = SKAction.repeat(cycle, count: 2)
    
    //Run all actions
    node.run(changeToColored)
    node.run(correct)
    node.run(wiggle)
}




