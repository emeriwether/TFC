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
    
    override func didMove(to view: SKView) {
        cookie.position = CGPoint(x: -320, y: 160)
        cookie.setScale(2)
        cookie.zPosition = 2
        self.addChild(cookie)
        
        let instructions = SKAction.playSoundFileNamed("CookieInstructions", waitForCompletion: false)
        run(instructions)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        //If duck sprite is touched...
        if cookie.contains(touch.location(in: self)) {
            correctTouches += 1
            
            cookie.texture = SKTexture(imageNamed: "Chocolate-Chip")
            
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
            incorrectTouches += 1
        }
    }
}

