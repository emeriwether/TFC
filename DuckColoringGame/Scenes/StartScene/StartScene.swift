//
//  StartScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether and Gustavo Figueroa. All rights reserved.
//

import SpriteKit

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
        startMonster.position = CGPoint(x:0, y: -250)
        startMonster.setScale(1.5)
        self.addChild(startMonster)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        let fade = SKTransition.fade(withDuration: 0.5)
        
        // if the start color button is touched, move to egg trainer scene
        if startColor.contains(touch.location(in: self)) {
            let colorTrainer1 = SKScene(fileNamed: "Trainer_Egg")
            colorTrainer1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(colorTrainer1!, transition: fade)
        }
        
        // if the start monster button is touched, move to monster scene 1
        if startMonster.contains(touch.location(in:self)) {
            let monsterScene1 = SKScene(fileNamed: "Monster_T1")
            monsterScene1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(monsterScene1!, transition: fade)
        }
    }
}

