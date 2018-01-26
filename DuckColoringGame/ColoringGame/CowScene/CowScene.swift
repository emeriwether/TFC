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
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var cow_incorrectTouches = 0
    var cow_correctTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil

        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_cow", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.cow_correctTouches == 0 && self.cow_incorrectTouches == 0 {
                self.reminderComplete = false
                let cow_reminder = SKAction.playSoundFileNamed("reminder_cow", waitForCompletion: true)
                self.run(cow_reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for cow sprite
        let cow = self.childNode(withName: "cow_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If cow sprite is touched...
            if physicsWorld.body(at: touch.location(in: self)) == cow?.physicsBody {
                cow_correctTouches += 1
                correctTouches += 1
                
                // Color cow
                let coloredCow:SKTexture = SKTexture(imageNamed: "cowScene_cow_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredCow], timePerFrame: 0.0001)
                cow!.run(changeToColored)
                
                // Play cow noise, and walk cow off screen
                let cowNoise = SKAction.playSoundFileNamed("cow", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 1000, duration: 3.0)
                cow!.run(cowNoise)
                cow!.run(moveRight)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let scoreScene = SKScene(fileNamed: "ScoreScene")
                    scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(scoreScene!)
                }
            }
            else {
                cow_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if cow_incorrectTouches == 3 && cow_correctTouches < 1 {
                reminderComplete = false
                let cowReminder = SKAction.playSoundFileNamed("reminder_cow", waitForCompletion: true)
                run(cowReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}





