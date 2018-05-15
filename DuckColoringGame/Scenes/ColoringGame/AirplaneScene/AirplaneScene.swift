//
//  AirplaneScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class AirplaneScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var airplane_incorrectTouches = 0
    var airplane_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_airplane", waitForCompletion: true)
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
            let airplane_reminder = SKAction.playSoundFileNamed("reminder_airplane", waitForCompletion: true)
            self.run(airplane_reminder, completion: { self.reminderComplete = true} )
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
                
                transitionScene (currentScene: self, sceneString: "ShoesScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for airplane sprite
        let airplane = self.childNode(withName: "airplane_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if airplane_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "ShoesScene", waitTime: 0, fadeTime: 2)
            }
            
            //If airplane sprite is touched...   
            if (physicsWorld.body(at: touch.location(in: self)) == airplane?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                airplane_correctTouches += 1
                numCorrectPerScene["airplane"] = numCorrectPerScene["airplane"]! + 1
                comboCompletedDict["fourItemLine"] = comboCompletedDict["fourItemLine"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (airplane_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    lineCorrectFT += 1
                    fourItemCorrectFT += 1
                    correctFirstTries["airplane"] = true
                    comboNumFTDict["fourItemLine"] = comboNumFTDict["fourItemLine"]! + 1
                }
                
                // Color airplane
                let coloredAirplane:SKTexture = SKTexture(imageNamed: "airplaneScene_airplane_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredAirplane], timePerFrame: 0.0001)
                airplane!.run(changeToColored)
                
                // Play airplane noise, and fly airplane off screen
                let airplaneNoise = SKAction.playSoundFileNamed("airplane", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 320, duration: 3.0)
                let moveUp = SKAction.moveTo(y: 700, duration: 3.0)
                airplane!.run(airplaneNoise)
                airplane!.run(moveRight)
                airplane!.run(moveUp)
                
                transitionScene (currentScene: self, sceneString: "ShoesScene", waitTime: 2, fadeTime: 1)
            }
            else {
                airplane_incorrectTouches += 1
                numIncorrectPerScene["airplane"] = numIncorrectPerScene["airplane"]! + 1
                comboNumIncorrectDict["fourItemLine"] = comboNumIncorrectDict["fourItemLine"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                airplane?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (airplane_incorrectTouches % 3 == 0) && airplane_correctTouches < 1  && airplane_incorrectTouches < 14 {
//                reminderComplete = false
//                let airplaneReminder = SKAction.playSoundFileNamed("reminder_airplane", waitForCompletion: true)
//                run(airplaneReminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = airplane_correctTouches + airplane_incorrectTouches
    }
}


