//
//  GameScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class DuckScene: SKScene {
    
    let duck = SKSpriteNode(imageNamed: "Duck_BW")
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    var duck_incorrectTouches = 0
    var duck_correctTouches = 0
    
    override func didMove(to view: SKView) {
        duck.position = CGPoint(x: 400, y: 100)
        duck.setScale(2)
        duck.zPosition = -1
        self.addChild(duck)
        
        let instructions = SKAction.playSoundFileNamed("Instructions", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
        
            //If duck sprite is touched...
            if duck.contains(touch.location(in: self)) {
                duck_correctTouches += 1
                correctTouches += 1
            
                //Change sprite to colored duck
                duck.texture = SKTexture(imageNamed: "Duck.png")
            
                //Variables for open mouth animation
                let openMouth:SKTexture = SKTexture(imageNamed: "Duck_OpenMouth")
                let closedMouth:SKTexture = SKTexture(imageNamed: "Duck")
                let animation:SKAction = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.1)
                let openMouthAction:SKAction = SKAction.repeat(animation, count: 5)
                //Variables for Quack audio
                let quack = SKAction.playSoundFileNamed("duckQuack", waitForCompletion: true)
                //Variables for move animation
                let move = SKAction.moveTo(x: 900, duration: 3.0)
                //Variable to wait
                let wait1 = SKAction.wait(forDuration: 1)
                //Sequence for wait, then move
                let sequenceDuck = SKAction.sequence([wait1, move])
            
                //Run all actions
                duck.run(openMouthAction)
                duck.run(quack)
                duck.run(sequenceDuck)
            
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let cookieScene = SKScene(fileNamed: "CookieScene")
                    cookieScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(cookieScene!)
                }
            
            }
            else {
                duck_incorrectTouches += 1
                incorrectTouches += 1
            }
            if duck_incorrectTouches == 3 && duck_correctTouches < 1 {
                reminderComplete = false
                let duck_reminder = SKAction.playSoundFileNamed("listenCarefully_Duck", waitForCompletion: true)
                run(duck_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}
