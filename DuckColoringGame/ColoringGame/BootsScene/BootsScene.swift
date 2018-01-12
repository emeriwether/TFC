//
//  BootsScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class BootsScene: SKScene {
    // local variable for boots sprite
    let boots = SKSpriteNode(imageNamed: "bootsScene_boots_bw")
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var boots_incorrectTouches = 0
    var boots_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // place the boots sprite on the page
        boots.position = CGPoint(x: -340, y: -345)
        boots.setScale(1.8)
        boots.zPosition = 2
        boots.physicsBody = SKPhysicsBody(texture: boots.texture!, size: boots.texture!.size())
        boots.physicsBody?.affectedByGravity = false
        self.addChild(boots)
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_boots", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.boots_correctTouches == 0 && self.boots_incorrectTouches == 0 {
                self.reminderComplete = false
                let boots_reminder = SKAction.playSoundFileNamed("reminder_boots", waitForCompletion: true)
                self.run(boots_reminder, completion: { self.reminderComplete = true} )
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
            
            //If boots sprite is touched...
            if boots.contains(touch.location(in: self)) {
                boots_correctTouches += 1
                correctTouches += 1
                
                // Color boots, play boots noise, and walk boots off screen
                boots.texture = SKTexture(imageNamed: "bootsScene_boots_colored")
                let bootsNoise = SKAction.playSoundFileNamed("boots", waitForCompletion: true)
                let moveLeft = SKAction.moveTo(x: -1000, duration: 3.0)
                boots.run(bootsNoise)
                boots.run(moveLeft)
                
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
            if boots_incorrectTouches == 3 && boots_correctTouches < 1 {
                reminderComplete = false
                let bootsReminder = SKAction.playSoundFileNamed("reminder_boots", waitForCompletion: true)
                run(bootsReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
    
}



