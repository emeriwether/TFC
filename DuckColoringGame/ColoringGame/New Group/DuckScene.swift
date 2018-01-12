//
//  DuckScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class DuckScene: SKScene {
    // local variable for duck sprite
    let duck = SKSpriteNode(imageNamed: "duckScene_duck_bw")
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var duck_incorrectTouches = 0
    var duck_correctTouches = 0
    
    
    override func didMove(to view: SKView) {
        // place the duck sprite on the page
        duck.position = CGPoint(x: 400, y: 100)
        duck.setScale(2)
        duck.zPosition = -1
        duck.physicsBody = SKPhysicsBody(texture: duck.texture!, alphaThreshold: 0.9, size: duck.texture!.size())
        duck.physicsBody?.affectedByGravity = false
        self.addChild(duck)
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_duck", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.duck_correctTouches == 0 && self.duck_incorrectTouches == 0 {
                self.reminderComplete = false
                let duck_reminder = SKAction.playSoundFileNamed("reminder_duck", waitForCompletion: true)
                self.run(duck_reminder, completion: { self.reminderComplete = true} )
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
            
            //If duck sprite is touched...
            //if duck.contains(touch.location(in: self)) {
            if physicsWorld.body(at: touch.location(in: self)) != nil {
                duck_correctTouches += 1
                correctTouches += 1
            
                // Change sprite to colored duck
                duck.texture = SKTexture(imageNamed: "duckScene_duck_colored_mouthClosed")
            
                //Variables for open mouth animation
                let openMouth:SKTexture = SKTexture(imageNamed: "duckScene_duck_colored_mouthOpen")
                let closedMouth:SKTexture = SKTexture(imageNamed: "duckScene_duck_colored_mouthClosed")
                let animation:SKAction = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.1)
                let openMouthAction = SKAction.repeat(animation, count: 5)
                //Variables for Quack audio
                let quack = SKAction.playSoundFileNamed("quack", waitForCompletion: true)
                //Variables for move animation
                let move = SKAction.moveTo(x: 900, duration: 3.0)
                //Variable to wait
                let wait1 = SKAction.wait(forDuration: 1)
                //Sequence for wait, then move
                let sequenceDuck = SKAction.sequence([wait1, move])
            
                //Run all actions
                duck.run(openMouthAction)
                duck.run(quack)
                duck.run(sequenceDuck)
            
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let cookieScene = SKScene(fileNamed: "CookieScene")
                    cookieScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(cookieScene!)
                }
            
            }
            else {
                duck_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if duck_incorrectTouches == 3 && duck_correctTouches < 1 {
                reminderComplete = false
                let duck_reminder = SKAction.playSoundFileNamed("reminder_duck", waitForCompletion: true)
                run(duck_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}
