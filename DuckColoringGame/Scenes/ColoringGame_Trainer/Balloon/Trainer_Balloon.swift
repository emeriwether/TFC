//
//  Trainer_Balloon.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class Trainer_Balloon: SKScene {
    //local variable for SpriteNode that will be over the training object
    private var balloon:SKSpriteNode?
    var closeButton:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var balloon_incorrectTouches = 0
    var balloon_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Connect variable with .sks file
        self.balloon = self.childNode(withName: "balloon") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.balloon_correctTouches == 0 && self.balloon_incorrectTouches == 0 {
                self.reminderComplete = false
                let balloon_reminder = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
                self.run(balloon_reminder, completion: { self.reminderComplete = true} )
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
            
            //If balloon sprite is touched...
            if (balloon?.contains(touch.location(in: self)))! {
                balloon_correctTouches += 1
                correctTouches += 1
                
                // Color balloon
                balloon?.texture = SKTexture(imageNamed: "colorTrainer_balloon_colored")
                
                // Play correct noise
                let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                balloon?.run(correct)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let breadScene = SKScene(fileNamed: "Trainer_Bread")
                    breadScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(breadScene!)
                }
            }
            else {
                balloon_incorrectTouches += 1
                incorrectTouches += 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                balloon?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if balloon_incorrectTouches == 3 && balloon_correctTouches < 1 {
                reminderComplete = false
                let balloon_reminder = SKAction.playSoundFileNamed("instructions_egg", waitForCompletion: true)
                run(balloon_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}
