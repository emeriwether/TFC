//
//  CookieScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class CookieScene: SKScene {
    
    let cookie = SKSpriteNode(imageNamed: "Chocolate-Chip_BW")
    var instructionsComplete:Bool = false
    
    var cookie_incorrectTouches = 0
    var cookie_correctTouches = 0
    
    override func didMove(to view: SKView) {
        cookie.position = CGPoint(x: -320, y: 160)
        cookie.setScale(2)
        cookie.zPosition = 2
        self.addChild(cookie)
        
        let instructions = SKAction.playSoundFileNamed("CookieInstructions", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if instructionsComplete == true {
            let touch = touches.first!
        
            //If duck sprite is touched...
            if cookie.contains(touch.location(in: self)) {
                cookie_correctTouches += 1
                correctTouches += 1
            
                cookie.texture = SKTexture(imageNamed: "Chocolate-Chip")
                
                let crunch = SKAction.playSoundFileNamed("crunch", waitForCompletion: true)
                cookie.run(crunch)

                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let airplaneScene = SKScene(fileNamed: "AirplaneScene")
                    airplaneScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(airplaneScene!)
                }
            }
            else {
                cookie_incorrectTouches += 1
                incorrectTouches += 1
            }
            if cookie_incorrectTouches == 3 && cookie_correctTouches < 1 {
                let cookie_reminder = SKAction.playSoundFileNamed("listenCarefully_Cookie", waitForCompletion: true)
                run(cookie_reminder)
            }
        }
    }
}

