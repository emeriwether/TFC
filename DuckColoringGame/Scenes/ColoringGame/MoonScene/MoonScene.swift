//
//  MoonScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class MoonScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var moon_incorrectTouches = 0
    var moon_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_moon", waitForCompletion: true)
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
            let moon_reminder = SKAction.playSoundFileNamed("reminder_moon", waitForCompletion: true)
            self.run(moon_reminder, completion: { self.reminderComplete = true} )
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
                
                transitionScene (currentScene: self, sceneString: "CowScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for moon sprite
        let moon = self.childNode(withName: "moon_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if moon_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "CowScene", waitTime: 0, fadeTime: 2)
            }
            
            //If moon sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == moon?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                moon_correctTouches += 1
                numCorrectPerScene["moon"] = numCorrectPerScene["moon"]! + 1
                comboCompletedDict["twoItemLine"] = comboCompletedDict["twoItemLine"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (moon_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    lineCorrectFT += 1
                    twoItemCorrectFT += 1
                    correctFirstTries["moon"] = true
                    comboNumFTDict["twoItemLine"] = comboNumFTDict["twoItemLine"]! + 1
                }
                
                // play correct wiggleOnly animation (function declared on HandScene.swift in coloring game)
                wiggleOnly(node: moon!, coloredImg: "moonScene_moon_colored", correctSound: "moon")
                
                transitionScene (currentScene: self, sceneString: "CowScene", waitTime: 4, fadeTime: 1)
            }
            else {
                moon_incorrectTouches += 1
                numIncorrectPerScene["moon"] = numIncorrectPerScene["moon"]! + 1
                comboNumIncorrectDict["twoItemLine"] = comboNumIncorrectDict["twoItemLine"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                moon?.run(wrong)
            }

            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (moon_incorrectTouches % 3 == 0) && moon_correctTouches < 1 && moon_incorrectTouches < 14 {
//                reminderComplete = false
//                let moon_reminder = SKAction.playSoundFileNamed("reminder_moon", waitForCompletion: true)
//                run(moon_reminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = moon_correctTouches + moon_incorrectTouches
    }
}

