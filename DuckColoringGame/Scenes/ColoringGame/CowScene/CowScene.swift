//
//  SpoonScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/23/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class CowScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var cow_incorrectTouches = 0
    var cow_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil

        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_cow", waitForCompletion: true)
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
            let cow_reminder = SKAction.playSoundFileNamed("reminder_cow", waitForCompletion: true)
            self.run(cow_reminder, completion: { self.reminderComplete = true} )
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
                
                transitionScene (currentScene: self, sceneString: "TrashScene", waitTime: 0, fadeTime: 2)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for cow sprite
        let cow = self.childNode(withName: "cow_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if cow_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "TrashScene", waitTime: 0, fadeTime: 2)
            }
            
            //If cow sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == cow?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                cow_correctTouches += 1
                numCorrectPerScene["cow"] = numCorrectPerScene["cow"]! + 1
                comboCompletedDict["threeItemLine"] = comboCompletedDict["threeItemLine"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (cow_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    lineCorrectFT += 1
                    threeItemCorrectFT += 1
                    correctFirstTries["cow"] = true
                    comboNumFTDict["threeItemLine"] = comboNumFTDict["threeItemLine"]! + 1
                }
                
                // Change sprite to colored cow
                let coloredCow:SKTexture = SKTexture(imageNamed: "cowScene_cow_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredCow], timePerFrame: 0.0001)
                cow!.run(changeToColored)
                
                //Variable for moo audio
                let moo = SKAction.playSoundFileNamed("cow", waitForCompletion: true)
                
                //Variables for move animation
                let move = SKAction.moveTo(x: 900, duration: 3.0)
                
                //Variables for walking animation
                let rightStep = SKTexture(imageNamed: "cowScene_cow_colored_right")
                let leftStep = SKTexture(imageNamed: "cowScene_cow_colored_left")
                let animationWalk = SKAction.animate(with: [rightStep, coloredCow, leftStep], timePerFrame: 0.1)
                let animationWalkRepeat = SKAction.repeat(animationWalk, count: 10)
                
                //Run all actions
                cow!.run(moo)
                cow!.run(move)
                cow!.run(animationWalkRepeat)
                
                transitionScene (currentScene: self, sceneString: "TrashScene", waitTime: 2, fadeTime: 1)
            }
            else {
                cow_incorrectTouches += 1
                numIncorrectPerScene["cow"] = numIncorrectPerScene["cow"]! + 1
                comboNumIncorrectDict["threeItemLine"] = comboNumIncorrectDict["threeItemLine"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                cow?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (cow_incorrectTouches % 3 == 0) && cow_correctTouches < 1 && cow_incorrectTouches < 14 {
//                reminderComplete = false
//                let cowReminder = SKAction.playSoundFileNamed("reminder_cow", waitForCompletion: true)
//                run(cowReminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = cow_correctTouches + cow_incorrectTouches
    }
}





