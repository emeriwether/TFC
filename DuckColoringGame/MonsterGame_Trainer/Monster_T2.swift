//
//  Monster_T1.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/21/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class Monster_T2: SKScene {
    
    private var dragObject:SKSpriteNode?
    private var backgroundObject:SKSpriteNode?
    private var targetZone:SKSpriteNode?
    private var defaultPosition:CGPoint?
    //private var defaultY:CGFloat?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for instruction item
        self.dragObject = self.childNode(withName: "appleObject") as? SKSpriteNode
        defaultPosition = dragObject?.position
        //defaultY = dragObject?.position.y
        self.backgroundObject = self.childNode(withName: "background") as? SKSpriteNode
        self.targetZone = self.childNode(withName: "boundry") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("find the dress", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.apple_correctTouches == 0 && self.apple_incorrectTouches == 0 {
                //May not run if 1 touch is made and may not loop.
                self.reminderComplete = false
                let reminder = SKAction.playSoundFileNamed("find the dress", waitForCompletion: true)
                self.run(reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            dragObject?.position.x = location.x
            dragObject?.position.y = location.y
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (targetZone?.contains((dragObject?.position)!))!{
            apple_correctTouches += 1
            correctTouches += 1
            dragObject?.removeFromParent()
            targetZone?.texture = SKTexture(imageNamed: "BasketApple")
            
            let fadeOut = SKAction.fadeOut(withDuration:1)
            let wait2 = SKAction.wait(forDuration: 1)
            let sequenceFade = SKAction.sequence([wait2, fadeOut])
            run(sequenceFade) {
                let monsterSceneT3 = SKScene(fileNamed: "Monster_T3")
                monsterSceneT3?.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(monsterSceneT3!)}
        }
        else{
            dragObject?.position = defaultPosition!
            apple_incorrectTouches += 1
            incorrectTouches += 1
        }
    }
}




