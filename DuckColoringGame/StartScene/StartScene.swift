//
//  StartScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

// Global variables to keep track of touches for the whole game
var incorrectTouches = 0
var correctTouches = 0

class StartScene: SKScene {
    // local variable for coloring game button
    let startColor = SKSpriteNode(imageNamed: "ColorStartButton")
    
    // local variable for piano game button
    let startMonster = SKSpriteNode(imageNamed: "FeedMonsterButton")
    
    override func didMove(to view: SKView) {
        // place start button on screen
        startColor.position = CGPoint(x: 0, y: 0)
        startColor.setScale(0.5)
        self.addChild(startColor)
        
        // place piano button on screen
        startMonster.position = CGPoint(x:0, y: -100)
        startMonster.setScale(0.5)
        self.addChild(startMonster)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        let fade = SKTransition.fade(withDuration: 0.5)
        
        // if the start button is touched, move to duck scene
        if startColor.contains(touch.location(in: self)) {
            let duckScene = SKScene(fileNamed: "Trainer_Egg")
            duckScene?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(duckScene!, transition: fade)
        }
        
        if startMonster.contains(touch.location(in:self)) {
            let monsterScene1 = SKScene(fileNamed: "Monster_T1")
            monsterScene1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(monsterScene1!, transition: fade)
        }
    }
}

