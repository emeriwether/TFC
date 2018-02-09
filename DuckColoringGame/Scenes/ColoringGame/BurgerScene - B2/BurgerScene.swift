//
//  Trainer_Egg.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class BurgerScene: SKScene {
    //local variable for SpriteNode that will be over the training object
    private var hamburger:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var hamburger_incorrectTouches = 0
    var hamburger_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Connect variable with .sks file
        self.hamburger = self.childNode(withName: "hamburger") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.hamburger_correctTouches == 0 && self.hamburger_incorrectTouches == 0 {
                self.reminderComplete = false
                let hamburger_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
                self.run(hamburger_reminder, completion: { self.reminderComplete = true} )
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
            
            //If hamburger sprite is touched...
            if (hamburger?.contains(touch.location(in: self)))! {
                hamburger_correctTouches += 1
                correctTouches += 1
                
                // Color hamburger
                hamburger?.texture = SKTexture(imageNamed: "colorTrainer_burger_colored")
                
                // Play crunch noise
                let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                hamburger?.run(correct)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let scoreScene = SKScene(fileNamed: "ScoreScene")
                    scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(scoreScene!)
                }
            }
            else {
                hamburger_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if hamburger_incorrectTouches == 3 && hamburger_correctTouches < 1 {
                reminderComplete = false
                let hamburger_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
                run(hamburger_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}



