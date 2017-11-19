//
//  GameScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

//test does this change my personal version of the game?
//one more test to see if this modifies original game

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var duck:SKSpriteNode?
    var incorrectTouches = 0
    var correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Attach "bw" sprite in GUI to object "duck" in script
        duck = self.childNode(withName: "bw") as! SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        //If duck sprite is touched...
        if duck!.contains(touch.location(in: self)) {
            correctTouches += 1
            
            //Change sprite to colored duck
            duck?.texture = SKTexture(imageNamed: "Duck.png")
            
            //Variables for open mouth animation
            let openMouth:SKTexture = SKTexture(imageNamed: "Duck_OpenMouth")
            let closedMouth:SKTexture = SKTexture(imageNamed: "Duck")
            let animation:SKAction = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.1)
            let openMouthAction:SKAction = SKAction.repeat(animation, count: 5)
            //Variables for Quack audio
            let quack = SKAction.playSoundFileNamed("duckQuack", waitForCompletion: false)
            //Variables for move animation
            let move = SKAction.moveTo(x: 900, duration: 3.0)
            //Variable to wait
            let wait = SKAction.wait(forDuration: 1)
            //Sequence for wait, then move
            let sequence = SKAction.sequence([wait, move])
            
            //Run all actions
            duck?.run(openMouthAction)
            duck?.run(quack)
            duck?.run(sequence)
        }
        else {
            incorrectTouches += 1
        }
    }
}
