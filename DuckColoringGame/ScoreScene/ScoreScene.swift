//
//  CookieScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class ScoreScene: SKScene {
    
    let retry = SKSpriteNode(imageNamed: "retryButton")
    let correctScoreLabel = SKLabelNode(fontNamed: "Arial")
    let incorrectScoreLabel = SKLabelNode(fontNamed: "Arial")
    
    override func didMove(to view: SKView) {
        retry.position = CGPoint(x: 0, y: 0)
        retry.setScale(2)
        self.addChild(retry)
        
        correctScoreLabel.text = "Correct touches: \(correctTouches)"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -160, y: -240)
        self.addChild(correctScoreLabel)
        
        incorrectScoreLabel.text = "Incorrect touches: \(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -160, y: -280)
        self.addChild(incorrectScoreLabel)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        if retry.contains(touch.location(in: self)) {
            
            correctTouches = 0
            incorrectTouches = 0
            
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }
    }
}

