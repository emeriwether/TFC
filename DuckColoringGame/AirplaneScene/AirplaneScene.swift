//
//  CookieScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class AirplaneScene: SKScene {
    
    let airplane = SKSpriteNode(imageNamed: "Plane2_BW")
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    var airplane_incorrectTouches = 0
    var airplane_correctTouches = 0
    
    override func didMove(to view: SKView) {
        airplane.position = CGPoint(x: -320, y: 250)
        airplane.setScale(2)
        airplane.zPosition = 2
        self.addChild(airplane)
        
        let instructions = SKAction.playSoundFileNamed("instructions_airplane", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If airplane sprite is touched...
            if airplane.contains(touch.location(in: self)) {
                airplane_correctTouches += 1
                correctTouches += 1
                
                airplane.texture = SKTexture(imageNamed: "Plane2")
                
                let airplaneNoise = SKAction.playSoundFileNamed("airplane", waitForCompletion: true)
                let moveRight = SKAction.moveTo(x: 320, duration: 3.0)
                let moveUp = SKAction.moveTo(y: 700, duration: 3.0)
                
                airplane.run(airplaneNoise)
                airplane.run(moveRight)
                airplane.run(moveUp)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let scoreScene = SKScene(fileNamed: "ScoreScene")
                    scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(scoreScene!)
                }
            }
            else {
                airplane_incorrectTouches += 1
                incorrectTouches += 1
            }
            if airplane_incorrectTouches == 3 && airplane_correctTouches < 1 {
                reminderComplete = false
                let airplaneReminder = SKAction.playSoundFileNamed("reminder_airplane", waitForCompletion: true)
                run(airplaneReminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}


