//
//  MouseScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class MouseScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var mouse_incorrectTouches = 0
    var mouse_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_mouse", waitForCompletion: true)
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
            let mouse_reminder = SKAction.playSoundFileNamed("reminder_mouse", waitForCompletion: true)
            self.run(mouse_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for mouse sprite
        let mouse = self.childNode(withName: "mouse_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            //If mouse sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == mouse?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                mouse_correctTouches += 1
                correctTouches += 1
                
                // Color mouse
                let coloredMouse:SKTexture = SKTexture(imageNamed: "mouseScene_mouse_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredMouse], timePerFrame: 0.0001)
                mouse!.run(changeToColored)
                
                // Play mouse noise, and move mouse off screen
                let mouseNoise = SKAction.playSoundFileNamed("mouse", waitForCompletion: true)
                let moveDown = SKAction.moveTo(y: -700, duration: 3.0)
                mouse!.run(mouseNoise)
                mouse!.run(moveDown)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let trashScene = SKScene(fileNamed: "TrashScene")
                    trashScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(trashScene!)
                }
            }
            else {
                mouse_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (mouse_incorrectTouches % 3 == 0) && mouse_correctTouches < 1 {
                reminderComplete = false
                let mouseReminder = SKAction.playSoundFileNamed("reminder_mouse", waitForCompletion: true)
                run(mouseReminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = mouse_correctTouches + mouse_incorrectTouches
    }
}




