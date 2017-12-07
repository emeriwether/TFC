//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class ScoreScene: SKScene {
    // local variable for retry button
    let retry = SKSpriteNode(imageNamed: "retryButton")
    
    // local variables for labels for touches scores
    let correctScoreLabel = SKLabelNode(fontNamed: "Arial")
    let incorrectScoreLabel = SKLabelNode(fontNamed: "Arial")
    
    override func didMove(to view: SKView) {
        // place retry button on screen
        retry.position = CGPoint(x: 0, y: 0)
        retry.setScale(2)
        self.addChild(retry)
        
        // place correct score on screen
        correctScoreLabel.text = "Correct touches: \(correctTouches)"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -160, y: -240)
        self.addChild(correctScoreLabel)
        
        // place incorrect score on screen
        incorrectScoreLabel.text = "Incorrect touches: \(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -160, y: -280)
        self.addChild(incorrectScoreLabel)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        // if retry button is touched
        if retry.contains(touch.location(in: self)) {
            // when restarting the game, reset touches scores
            correctTouches = 0
            incorrectTouches = 0
            
            // transition scene back to start
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }
    }
}

