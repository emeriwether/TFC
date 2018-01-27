//
//  SpoonScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 1/8/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class SpoonScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var spoon_incorrectTouches = 0
    var spoon_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_spoon", waitForCompletion: true)
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
            let spoon_reminder = SKAction.playSoundFileNamed("reminder_spoon", waitForCompletion: true)
            self.run(spoon_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for spoon sprite
        let spoon = self.childNode(withName: "spoon_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If spoon sprite is touched...
            if physicsWorld.body(at: touch.location(in: self)) == spoon?.physicsBody {
                spoon_correctTouches += 1
                correctTouches += 1
                
                // Color spoon
                let coloredSpoon:SKTexture = SKTexture(imageNamed: "spoonScene_spoon_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredSpoon], timePerFrame: 0.0001)
                spoon!.run(changeToColored)
                
                // Play spoon noise, and move spoon off screen
                let spoonNoise = SKAction.playSoundFileNamed("spoon", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 1000, duration: 3.0)
                spoon!.run(spoonNoise)
                spoon!.run(moveRight)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let cowScene = SKScene(fileNamed: "CowScene")
                    cowScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(cowScene!)
                }
            }
            else {
                spoon_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if spoon_incorrectTouches == 3 && spoon_correctTouches < 1 {
                reminderComplete = false
                let spoonReminder = SKAction.playSoundFileNamed("reminder_spoon", waitForCompletion: true)
                run(spoonReminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = spoon_correctTouches + spoon_incorrectTouches
    }
}




