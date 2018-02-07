//
//  BootsScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class BootsScene: GameScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var boots_incorrectTouches = 0
    var boots_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil

        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_boots", waitForCompletion: true)
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
            let boots_reminder = SKAction.playSoundFileNamed("reminder_boots", waitForCompletion: true)
            self.run(boots_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for boots sprite
        let boots = self.childNode(withName: "boots_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true)  && (sceneOver == false) {
            let touch = touches.first!
            
            //If boots sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == boots?.physicsBody)  && (sceneOver == false) {
                sceneOver = true
                boots_correctTouches += 1
                correctTouches += 1
                
                // Color boots
                let coloredBoots = SKTexture(imageNamed: "bootsScene_boots_colored")
                
                let changeToColored = SKAction.animate(with: [coloredBoots], timePerFrame: 0.0001)
                boots!.run(changeToColored)
                
                // Variable for play boots noise
                let bootsNoise = SKAction.playSoundFileNamed("boots", waitForCompletion: true)
                
                // Variables to animate boots and walk boots off screen
                let rightStep = SKTexture(imageNamed: "bootsScene_boots_colored_rightStep")
                let leftStep = SKTexture(imageNamed: "bootsScene_boots_colored_leftStep")
                let animationWalk = SKAction.animate(with: [rightStep, coloredBoots, leftStep], timePerFrame: 0.1)
                let animationWalkRepeat = SKAction.repeat(animationWalk, count: 8)
                let moveLeft = SKAction.moveTo(x: -1000, duration: 3.0)
                
                // Run all actions
                boots!.run(bootsNoise)
                boots!.run(animationWalkRepeat)
                boots!.run(moveLeft)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let scoreScene = SKScene(fileNamed: "MouseScene")
                    scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(scoreScene!)
                }
            }
            else {
                boots_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (boots_incorrectTouches % 3 == 0) && boots_correctTouches < 1 {
                reminderComplete = false
                let bootsReminder = SKAction.playSoundFileNamed("reminder_boots", waitForCompletion: true)
                run(bootsReminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = boots_correctTouches + boots_incorrectTouches
    }
}



