//
//  CakeScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class CakeScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var cake_incorrectTouches = 0
    var cake_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_duck", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        /////////////////////////////////
        ////// IDLE REMINDER TIMER //////
        /////////////////////////////////
        let oneSecTimer = SKAction.wait(forDuration: 1.0)
        var timerCount = 1
        var currentTouches = 0
        
        // set up sequence for if the scene has not been touched for 10 seconds: play the idle reminder
        let reminderIfIdle = SKAction.run {
            self.reminderComplete = false
            let cake_reminder = SKAction.playSoundFileNamed("reminder_duck", waitForCompletion: true)
            self.run(cake_reminder, completion: { self.reminderComplete = true} )
        }
        
        // for every one second, do this action:
        let timerAction = SKAction.run {
            // if no touch...
            if (self.totalTouches - currentTouches == 0) {
                // ...timer progresses one second...
                timerCount += 1
            }
                // ... else if a touch...
            else {
                // ... increase touch count...
                currentTouches += 1
                // ... and start timer over...
                timerCount = 1
            }
            // if timer seconds are divisable by 10 ...
            if (timerCount % 10 == 0) {
                // ... play the reminder.
                self.run(reminderIfIdle)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for cake sprite
        let cake = self.childNode(withName: "cake_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            //If cake sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == cake?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                cake_correctTouches += 1
                numCorrectPerScene["cake"] = numCorrectPerScene["cake"]! + 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (cake_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    sceneCorrectFT += 1
                    twoItemCorrectFT += 1
                    correctFirstTriesArray.append("cake")
                }
                
                // Change sprite to colored cake
                let coloredCake:SKTexture = SKTexture(imageNamed: "cakeScene_cake_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredCake], timePerFrame: 0.0001)
                cake!.run(changeToColored)
                
                //Variables for cake audio
                let happyBirthday = SKAction.playSoundFileNamed("cake", waitForCompletion: true)
                
                //Run all actions
                cake!.run(happyBirthday)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:4)
                let wait2 = SKAction.wait(forDuration: 4)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let strollerScene = SKScene(fileNamed: "StrollerScene")
                    strollerScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(strollerScene!)
                }
            }
            else {
                cake_incorrectTouches += 1
                numIncorrectPerScene["cake"] = numIncorrectPerScene["cake"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                cake?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (cake_incorrectTouches % 3 == 0) && cake_correctTouches < 1 {
                reminderComplete = false
                let cake_reminder = SKAction.playSoundFileNamed("reminder_duck", waitForCompletion: true)
                run(cake_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = cake_correctTouches + cake_incorrectTouches
    }
}


