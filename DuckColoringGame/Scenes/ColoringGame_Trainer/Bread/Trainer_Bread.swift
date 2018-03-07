//
//  Trainer_Bread.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether and Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Eleanor Meriwether and Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class Trainer_Bread: SKScene {
    // local variables to keep track of touches for this scene
    var bread_incorrectTouches = 0
    var bread_correctTouches = 0
    var totalTouches = 0
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_bread", waitForCompletion: true)
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
            let bread_reminder = SKAction.playSoundFileNamed("reminder_bread", waitForCompletion: true)
            self.run(bread_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for rock sprite
        let bread = self.childNode(withName: "bread")

        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            //If bread sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == bread?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                bread_correctTouches += 1
                
                // play correct scale&wiggle animation (function declared on Trainer_Balloon.swift in coloring game)
                animateNode(node: bread!, coloredImg: "colorTrainer_bread_colored", correctSound: "correct")
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let rockScene = SKScene(fileNamed: "RockScene")
                    rockScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(rockScene!)
                }
            }
            else {
                bread_incorrectTouches += 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                bread?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if bread_incorrectTouches % 3 == 0 && bread_correctTouches < 1 {
                reminderComplete = false
                let bread_reminder = SKAction.playSoundFileNamed("reminder_bread", waitForCompletion: true)
                run(bread_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = bread_correctTouches + bread_incorrectTouches
    }
}

