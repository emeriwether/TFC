//
//  PianoScene8.swift
//  TimeForChildrenGame
//
//  Created by Gustavo Figueroa on 12/7/17.
//  Copyright © 2017 Gustavo Figueroa. All rights reserved.
//

import SpriteKit

class PianoScene8: SKScene {
    
    // Variable for target piano key
    private var targetItem:SKSpriteNode?
    
    // Local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // Local variables to keep track of touches for this scene
    var piano8_incorrectTouches = 0
    var piano8_correctTouches = 0
    
    override func didMove(to view: SKView) {
        // Add the SpriteNode for instruction item
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        // Run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // If the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.piano8_correctTouches == 0 && self.piano8_incorrectTouches == 0 {
                //May not run if 1 touch is made and may not loop.
                self.reminderComplete = false
                // ********ALSO, THIS AUDIO JUST REPEATS ORIGINAL INSTRUCTIONS, INSTEAD OF REPHRASING. PLEASE REQUEST A REMINDER AUDIO FROM YAO
                let reminder_piano8 = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
                self.run(reminder_piano8, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If piano key sprite is touched...
            if (targetItem?.contains(touch.location(in: self)))! {
                // Award points for correctness
                piano8_correctTouches += 1
                correctTouches += 1
                // Play audio feedback for the correct touch
                let correctTouch = SKAction.playSoundFileNamed("correctAudio7", waitForCompletion: true)
                self.run(correctTouch, completion: { self.reminderComplete = true} )
                
                // Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                // Scene Transition
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let piano9 = SKScene(fileNamed: "PianoScene9")
                    piano9?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(piano9!)
                }
                
            }
            else {
                // Else, award points for incorrect touch
                piano8_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if piano8_incorrectTouches == 3 && piano8_correctTouches < 1 {
                reminderComplete = false
                // ********THIS AUDIO JUST REPEATS ORIGINAL INSTRUCTIONS, INSTEAD OF REPHRASING. PLEASE REQUEST A REMINDER AUDIO FROM YAO
                let reminder_piano8 = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
                run(reminder_piano8, completion: { self.reminderComplete = true} )
            }
            
        }
        
    }
}

