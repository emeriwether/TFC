//
//  TrashScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/23/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class TrashScene: SKScene {
    // local variable for trash sprite
    let trash = SKSpriteNode(imageNamed: "trashScene_trash_bw")
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var trash_incorrectTouches = 0
    var trash_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // place the trash sprite on the page
        trash.position = CGPoint(x: -413, y: -93)
        trash.setScale(1.8)
        trash.zPosition = 3
        trash.physicsBody = SKPhysicsBody(texture: trash.texture!, size: trash.texture!.size())
        trash.physicsBody?.affectedByGravity = false
        self.addChild(trash)
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("trash_instructions_Placeholder", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.trash_correctTouches == 0 && self.trash_incorrectTouches == 0 {
                self.reminderComplete = false
                let trash_reminder = SKAction.playSoundFileNamed("trash_reminder_Placeholder", waitForCompletion: true)
                self.run(trash_reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If trash sprite is touched...
            if trash.contains(touch.location(in: self)) {
                trash_correctTouches += 1
                correctTouches += 1
                
                // Color trash, play trash noise, and move trash off screen
                trash.texture = SKTexture(imageNamed: "trashScene_trash_colored")
                let trashNoise = SKAction.playSoundFileNamed("trash_Placeholder", waitForCompletion: true)
                let moveLeft = SKAction.moveTo(x: -1000, duration: 3.0)
                trash.run(trashNoise)
                trash.run(moveLeft)
                
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
                let trashReminder = SKAction.playSoundFileNamed("trash_reminder_Placeholder", waitForCompletion: true)
                run(trashReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
    
}



