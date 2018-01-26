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
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var trash_incorrectTouches = 0
    var trash_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil

        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_trash", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.trash_correctTouches == 0 && self.trash_incorrectTouches == 0 {
                self.reminderComplete = false
                let trash_reminder = SKAction.playSoundFileNamed("reminder_trash", waitForCompletion: true)
                self.run(trash_reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for trash sprite
        let trash = self.childNode(withName: "trash_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If trash sprite is touched...
            if physicsWorld.body(at: touch.location(in: self)) == trash?.physicsBody {
                trash_correctTouches += 1
                correctTouches += 1
                
                // Color trash
                let coloredTrash:SKTexture = SKTexture(imageNamed: "trashScene_trash_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredTrash], timePerFrame: 0.0001)
                trash!.run(changeToColored)
                
                // Play trash noise, and move trash off screen
                let trashNoise = SKAction.playSoundFileNamed("trash", waitForCompletion: true)
                let moveLeft = SKAction.moveTo(x: -1000, duration: 3.0)
                trash!.run(trashNoise)
                trash!.run(moveLeft)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let spoonScene = SKScene(fileNamed: "SpoonScene")
                    spoonScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(spoonScene!)
                }
            }
            else {
                trash_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if trash_incorrectTouches == 3 && trash_correctTouches < 1 {
                reminderComplete = false
                let trashReminder = SKAction.playSoundFileNamed("reminder_trash", waitForCompletion: true)
                run(trashReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}



