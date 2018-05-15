//
//  LionScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class LionScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var lion_incorrectTouches = 0
    var lion_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_lion", waitForCompletion: true)
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
            let lion_reminder = SKAction.playSoundFileNamed("reminder_lion", waitForCompletion: true)
            self.run(lion_reminder, completion: { self.reminderComplete = true} )
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
                
                transitionScene (currentScene: self, sceneString: "HandScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for lion sprite
        let lion = self.childNode(withName: "lion_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if lion_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "HandScene", waitTime: 0, fadeTime: 2)
            }
            
            //If lion sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == lion?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                lion_correctTouches += 1
                numCorrectPerScene["lion"] = numCorrectPerScene["lion"]! + 1
                comboCompletedDict["threeItemSimple"] = comboCompletedDict["threeItemSimple"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (lion_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    simpleCorrectFT += 1
                    threeItemCorrectFT += 1
                    correctFirstTries["lion"] = true
                    comboNumFTDict["threeItemSimple"] = comboNumFTDict["threeItemSimple"]! + 1
                }
                
                // Change sprite to colored lion
                let coloredlion:SKTexture = SKTexture(imageNamed: "lionScene_lion_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredlion], timePerFrame: 0.0001)
                lion!.run(changeToColored)
                
                //Variables for lion audio
                let roar = SKAction.playSoundFileNamed("lion", waitForCompletion: true)
                
                // Variables for roar action
                let roarAction = SKTexture(imageNamed: "lionScene_lion_colored_openMouth")
                let animationRoar = SKAction.animate(with: [roarAction, coloredlion], timePerFrame: 0.01)
                
                //Run all actions
                lion!.run(roar)
                lion!.run(animationRoar)

                transitionScene (currentScene: self, sceneString: "HandScene", waitTime: 2, fadeTime: 1)
            }
            else {
                lion_incorrectTouches += 1
                numIncorrectPerScene["lion"] = numIncorrectPerScene["lion"]! + 1
                comboNumIncorrectDict["threeItemSimple"] = comboNumIncorrectDict["threeItemSimple"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                lion?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (lion_incorrectTouches % 3 == 0) && lion_correctTouches < 1 && lion_incorrectTouches < 14 {
//                reminderComplete = false
//                let lion_reminder = SKAction.playSoundFileNamed("reminder_lion", waitForCompletion: true)
//                run(lion_reminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = lion_correctTouches + lion_incorrectTouches
    }
}





