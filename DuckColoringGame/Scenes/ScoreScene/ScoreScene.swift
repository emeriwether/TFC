//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

// public variables to keep track of statistics
var numOfCorrectFirstTry = 0
var numOfCorrectSetSize2 = 0
var numOfCorrectSetSize3 = 0
var numOfCorrectSetSize4 = 0
var numOfCorrectSimpleBG = 0
var numOfCorrectLineBG = 0
var numOfCorrectSceneBG = 0
var incorrectTouches = 0
var correctTouches = 0

class ScoreScene: SKScene {
    // local variable for retry button
    let retry = SKSpriteNode(imageNamed: "retryButton")

    // local variables
    let correctFirstTryLabel = SKLabelNode(fontNamed:"Arial")
    let incorrectScoreLabel = SKLabelNode(fontNamed: "Arial")
    let correctScoreLabel = SKLabelNode(fontNamed: "Arial")
    let setSize2Label = SKLabelNode(fontNamed: "Arial")
    let setSize3Label = SKLabelNode(fontNamed: "Arial")
    let setSize4Label = SKLabelNode(fontNamed: "Arial")
    let simpleBGLabel = SKLabelNode(fontNamed: "Arial")
    let lineBGLabel = SKLabelNode(fontNamed: "Arial")
    let sceneBGLabel = SKLabelNode(fontNamed: "Arial")
    
    override func didMove(to view: SKView) {
        
        // place retry button on screen
        retry.position = CGPoint(x: 0, y: 0)
        retry.setScale(2)
        self.addChild(retry)
        
        // place correct first try screens  
        correctFirstTryLabel.text = "Number of screens with correct first try: \(numOfCorrectFirstTry)"
        correctFirstTryLabel.fontSize = 20
        correctFirstTryLabel.position = CGPoint(x: -480, y: -200)
        self.addChild(correctFirstTryLabel)
        
        // place incorrect score on screen
        incorrectScoreLabel.text = "Total incorrect touches: \(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -480, y: -240)
        self.addChild(incorrectScoreLabel)
        
        // place correct score on screen
        correctScoreLabel.text = "Total correct touches: \(correctTouches)"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -480, y: -280)
        self.addChild(correctScoreLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "Total correct touches in set size 2: \(numOfCorrectSetSize2)"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -480, y: -320)
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "Total correct touches in set size 3: \(numOfCorrectSetSize3)"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -480, y: -360)
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "Total correct touches in set size 4: \(numOfCorrectSetSize4)"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -480, y: -400)
        self.addChild(setSize4Label)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "Total correct touches in simple bg type: \(numOfCorrectSimpleBG)"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: 160, y: -200)
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "Total correct touches in line bg type: \(numOfCorrectLineBG)"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: 160, y: -240)
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "Total correct touches in scene bg type: \(numOfCorrectSceneBG)"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: 160, y: -280)
        self.addChild(sceneBGLabel)
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

