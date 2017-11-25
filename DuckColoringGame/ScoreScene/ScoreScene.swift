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
    
    let scoreLabel = SKLabelNode(text: "Correct Touches: \(correctTouches)    Incorrect Touches: \(incorrectTouches)")
    
    override func didMove(to view: SKView) {
        scoreLabel.position = CGPoint(x: 0, y: 0)
        scoreLabel.setScale(2)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)

    }

}

