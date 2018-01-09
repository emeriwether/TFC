//
//  MouseScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class MouseScene: SKScene {
    // local variable for mouse sprite
    let mouse = SKSpriteNode(imageNamed: "mouseScene_mouse_bw")
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var mouse_incorrectTouches = 0
    var mouse_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // place the mouse sprite on the page
        mouse.position = CGPoint(x: 440, y: -200)
        mouse.setScale(1.8)
        mouse.zPosition = 2
        self.addChild(mouse)
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_mouse", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.mouse_correctTouches == 0 && self.mouse_incorrectTouches == 0 {
                self.reminderComplete = false
                let mouse_reminder = SKAction.playSoundFileNamed("reminder_mouse", waitForCompletion: true)
                self.run(mouse_reminder, completion: { self.reminderComplete = true} )
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
            
            //If mouse sprite is touched...
            if mouse.contains(touch.location(in: self)) {
                mouse_correctTouches += 1
                correctTouches += 1
                
                // Color mouse, play mouse noise, and move mouse off screen
                mouse.texture = SKTexture(imageNamed: "mouseScene_mouse_colored")
                let mouseNoise = SKAction.playSoundFileNamed("mouse", waitForCompletion: true)
                let moveDown = SKAction.moveTo(y: -700, duration: 3.0)
                mouse.run(mouseNoise)
                mouse.run(moveDown)
                
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
            if mouse_incorrectTouches == 3 && mouse_correctTouches < 1 {
                reminderComplete = false
                let mouseReminder = SKAction.playSoundFileNamed("reminder_mouse", waitForCompletion: true)
                run(mouseReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
    
}




