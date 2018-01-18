//
//  SpoonScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 1/8/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class SpoonScene: SKScene {
    // local variable for spoon sprite
    let spoon = SKSpriteNode(imageNamed: "spoonScene_spoon_bw")
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var spoon_incorrectTouches = 0
    var spoon_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // place the spoon sprite on the page
        spoon.position = CGPoint(x: 525, y: 0)
        spoon.zPosition = 3
        spoon.physicsBody = SKPhysicsBody(texture: spoon.texture!, size: spoon.texture!.size())
        spoon.physicsBody?.affectedByGravity = false
        self.addChild(spoon)
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_spoon", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.spoon_correctTouches == 0 && self.spoon_incorrectTouches == 0 {
                self.reminderComplete = false
                let spoon_reminder = SKAction.playSoundFileNamed("reminder_spoon", waitForCompletion: true)
                self.run(spoon_reminder, completion: { self.reminderComplete = true} )
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
            
            //If spoon sprite is touched...
            if spoon.contains(touch.location(in: self)) {
                spoon_correctTouches += 1
                correctTouches += 1
                
                // Color spoon, play spoon noise, and move spoon off screen
                spoon.texture = SKTexture(imageNamed: "spoonScene_spoon_colored")
                let spoonNoise = SKAction.playSoundFileNamed("spoon", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 1000, duration: 3.0)
                spoon.run(spoonNoise)
                spoon.run(moveRight)
                
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
    }
}




