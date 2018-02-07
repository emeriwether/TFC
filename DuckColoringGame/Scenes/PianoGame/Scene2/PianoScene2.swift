//
//  PianoScene2.swift
//  TimeForChildrenGame
//
//  Created by Gustavo Figueroa on 12/7/17.
//  Copyright © 2017 Gustavo Figueroa. All rights reserved.
//

import SpriteKit
// ********DO WE NEED TO IMPORT GAMEPLAY AND AVFOUNDATION? ARE WE USING THEM?
import GameplayKit
import AVFoundation

class PianoScene2: SKScene {
    
    private var correctAudio: AVAudioPlayer?
    private var targetItem:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    // ********UPDATE LOCAL VARIABLE NAMES TO REFLECT THIS SCENE. SHOULD BE "piano2_incorrectTouches" etc
    var duck_incorrectTouches = 0
    var duck_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for instruction item
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        // run the introductory instructions
        // ********RENAME THE AUDIO TO SOMETHING THAT CONNECTS WITH THIS GAME & SCENE? LIKE "instructions_piano2"
        let instructions = SKAction.playSoundFileNamed("Are you ready for more Now find the bathtub", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.duck_correctTouches == 0 && self.duck_incorrectTouches == 0 {
                //May not run if 1 touch is made and may not loop.
                self.reminderComplete = false
                // ********RENAME THE AUDIO TO SOMETHING THAT CONNECTS WITH THIS GAME & SCENE? LIKE "reminder_piano2"
                // ********ALSO, THIS AUDIO JUST REPEATS ORIGINAL INSTRUCTIONS, INSTEAD OF REPHRASING. PLEASE REQUEST A REMINDER AUDIO FROM YAO
                let reminder = SKAction.playSoundFileNamed("Are you ready for more Now find the bathtub", waitForCompletion: true)
                self.run(reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If duck sprite is touched...
            // ********UPDATE COMMENTS  TO REFLECT THIS SCENE. SHOULD BE "If piano targetItem is touched..." etc
            if (targetItem?.contains(touch.location(in: self)))! {
                // ********UPDATE LOCAL VARIABLE NAMES TO REFLECT THIS SCENE. SHOULD BE "piano1_correctTouches"
                duck_correctTouches += 1
                correctTouches += 1
                
                //Add correct press audio sound
                // ********WHERE IS CORRECT PRESS AUDIO SOUND?
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    // ********UPDATE VARIABLE NAME FOR SCENE (SHOULD BE "piano3")
                    let cookieScene = SKScene(fileNamed: "PianoScene3")
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
                // ********ALSO CAN WE RENAME THE AUDIO TO SOMETHING THAT CONNECTS WITH THIS GAME & SCENE? LIKE "reminder_piano2"
                // ********ALSO, THIS AUDIO JUST REPEATS ORIGINAL INSTRUCTIONS, INSTEAD OF REPHRASING. PLEASE REQUEST A REMINDER AUDIO FROM YAO
                // ********UPDATE LOCAL VARIABLE NAMES TO REFLECT THIS SCENE. SHOULD BE "reminder_piano2"
                let duck_reminder = SKAction.playSoundFileNamed("Are you ready for more Now find the bathtub", waitForCompletion: true)
                run(duck_reminder, completion: { self.reminderComplete = true} )
            }
            
        }
        
    }
}
