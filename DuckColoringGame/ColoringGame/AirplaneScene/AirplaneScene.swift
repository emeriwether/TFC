//
//  AirplaneScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class AirplaneScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var airplane_incorrectTouches = 0
    var airplane_correctTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_airplane", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.airplane_correctTouches == 0 && self.airplane_incorrectTouches == 0 {
                self.reminderComplete = false
                let airplane_reminder = SKAction.playSoundFileNamed("reminder_airplane", waitForCompletion: true)
                self.run(airplane_reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for airplane sprite
        let airplane = self.childNode(withName: "airplane_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If airplane sprite is touched...   
            if physicsWorld.body(at: touch.location(in: self)) == airplane?.physicsBody {
                airplane_correctTouches += 1
                correctTouches += 1
                
                // Color airplane
                let coloredAirplane:SKTexture = SKTexture(imageNamed: "airplaneScene_airplane_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredAirplane], timePerFrame: 0.0001)
                airplane!.run(changeToColored)
                
                // Play airplane noise, and fly airplane off screen
                let airplaneNoise = SKAction.playSoundFileNamed("airplane", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 320, duration: 3.0)
                let moveUp = SKAction.moveTo(y: 700, duration: 3.0)
                airplane!.run(airplaneNoise)
                airplane!.run(moveRight)
                airplane!.run(moveUp)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let scoreScene = SKScene(fileNamed: "BootsScene")
                    scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(scoreScene!)
                }
            }
            else {
                airplane_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if airplane_incorrectTouches == 3 && airplane_correctTouches < 1 {
                reminderComplete = false
                let airplaneReminder = SKAction.playSoundFileNamed("reminder_airplane", waitForCompletion: true)
                run(airplaneReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}


