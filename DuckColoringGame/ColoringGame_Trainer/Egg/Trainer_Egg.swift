//
//  Trainer_Egg.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class Trainer_Egg: SKScene {
    //local variable for SpriteNode that will be over the training object
    private var egg:SKSpriteNode?
    // local variable for background sprite
    private var background:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var egg_incorrectTouches = 0
    var egg_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Connect variable with .sks file
        self.egg = self.childNode(withName: "egg") as? SKSpriteNode
        self.background = self.childNode(withName: "background") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.egg_correctTouches == 0 && self.egg_incorrectTouches == 0 {
                self.reminderComplete = false
                let egg_reminder = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
                self.run(egg_reminder, completion: { self.reminderComplete = true} )
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
            
            //If egg sprite is touched...
            if (egg?.contains(touch.location(in: self)))! {
                egg_correctTouches += 1
                correctTouches += 1
                
                // Color egg
                egg?.texture = SKTexture(imageNamed: "colorTrainer_egg_colored")
                
                // Play crunch noise
                let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                egg?.run(correct)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let breadScene = SKScene(fileNamed: "Trainer_Bread")
                    breadScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(breadScene!)
                }
            }
            else {
                egg_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if egg_incorrectTouches == 3 && egg_correctTouches < 1 {
                reminderComplete = false
                let egg_reminder = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
                run(egg_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}
