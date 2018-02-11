//
//  TrashScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 1/8/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class TrashScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var trash_incorrectTouches = 0
    var trash_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil

        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_trash", waitForCompletion: true)
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
            let trash_reminder = SKAction.playSoundFileNamed("reminder_trash", waitForCompletion: true)
            self.run(trash_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for trash sprite
        let trash = self.childNode(withName: "trash_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            //If trash sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == trash?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                trash_correctTouches += 1
                correctTouches += 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (trash_incorrectTouches == 0) {
                    numOfCorrectFirstTry += 1
                    numOfCorrectLineBG += 1
                    numOfCorrectSetSize3 += 1
                    
                    correctFirstTriesArray.append("trash")
                    correctTouchesArray.append("trash")
                    correctSetSize3.append("trash")
                    correctBGLine.append("trash")
                }
                
                // Color trash
                let coloredTrash:SKTexture = SKTexture(imageNamed: "trashScene_trash_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredTrash], timePerFrame: 0.0001)
                trash!.run(changeToColored)
                
                // Variable for trash noise
                let trashNoise = SKAction.playSoundFileNamed("trash", waitForCompletion: true)
                
                // Variables for trash animation
                let lidOne = SKTexture(imageNamed: "trashScene_trash_colored_lid1")
                let lidTwo = SKTexture(imageNamed: "trashScene_trash_colored_lid2")
                let animationLid = SKAction.animate(with: [lidOne, coloredTrash, lidTwo], timePerFrame: 0.1)
                let animationLidRepeat = SKAction.repeat(animationLid, count: 6)
                
                // Run all actions
                trash!.run(animationLidRepeat)
                trash!.run(trashNoise)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let airplaneScene = SKScene(fileNamed: "AirplaneScene")
                    airplaneScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(airplaneScene!)
                }
            }
            else {
                trash_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (trash_incorrectTouches % 3 == 0) && trash_correctTouches < 1 {
                reminderComplete = false
                let trashReminder = SKAction.playSoundFileNamed("reminder_trash", waitForCompletion: true)
                run(trashReminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = trash_correctTouches + trash_incorrectTouches
    }
}



