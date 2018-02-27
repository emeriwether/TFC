//
//  StartScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether and Gustavo Figueroa. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for buttons
        let startColor = self.childNode(withName: "colorStartButton")
        let startMonster = self.childNode(withName: "monsterStartButton")
        let startPiano = self.childNode(withName: "pianoStartButton")
        
        let touch = touches.first!
        
        let fade = SKTransition.fade(withDuration: 0.5)
        
        // if the start color button is touched, move to balloon trainer scene
        if startColor!.contains(touch.location(in: self)) {
            let colorTrainer1 = SKScene(fileNamed: "Trainer_Balloon")
            colorTrainer1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(colorTrainer1!, transition: fade)
        }
        
        // if the start monster button is touched, move to monster scene 1
        if startMonster!.contains(touch.location(in:self)) {
            let monsterScene1 = SKScene(fileNamed: "Monster_T1")
            monsterScene1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(monsterScene1!, transition: fade)
        }
        
        // if the start piano button is touched, move to piano scene 1
        if startPiano!.contains(touch.location(in:self)) {
            let pianoScene1 = SKScene(fileNamed: "PianoScene1")
            pianoScene1?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(pianoScene1!, transition: fade)
        }
    }
}

