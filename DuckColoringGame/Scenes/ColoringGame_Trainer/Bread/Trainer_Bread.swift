//
//  Trainer_Bread.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class Trainer_Bread: SKScene {
    //local variable for SpriteNode that will be over the training object
    private var bread:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var bread_incorrectTouches = 0
    var bread_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Connect variable with .sks file
        self.bread = self.childNode(withName: "bread") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_bread", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.bread_correctTouches == 0 && self.bread_incorrectTouches == 0 {
                self.reminderComplete = false
                let bread_reminder = SKAction.playSoundFileNamed("reminder_bread", waitForCompletion: true)
                self.run(bread_reminder, completion: { self.reminderComplete = true} )
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
            
            //If bread sprite is touched...
            if (bread?.contains(touch.location(in: self)))! {
                bread_correctTouches += 1
                
                // Color bread
                bread?.texture = SKTexture(imageNamed: "colorTrainer_bread_colored")
                
                // Play correct noise
                let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                bread?.run(correct)
                
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
            if bread_incorrectTouches == 3 && bread_correctTouches < 1 {
                reminderComplete = false
                let bread_reminder = SKAction.playSoundFileNamed("reminder_bread", waitForCompletion: true)
                run(bread_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}

