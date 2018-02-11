//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

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
        
        // place correct first try screens  
        correctFirstTryLabel.text = "\(numOfCorrectFirstTry) /16"
        correctFirstTryLabel.fontSize = 20
        correctFirstTryLabel.position = CGPoint(x: 12, y: 332.037)
        self.addChild(correctFirstTryLabel)

        // place correct score on screen
        correctScoreLabel.text = "\(correctTouches) /16"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -124.047, y: 305)
        self.addChild(correctScoreLabel)
        
        // place incorrect score on screen
        incorrectScoreLabel.text = "\(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -91.999, y: 280.113)
        self.addChild(incorrectScoreLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "\(numOfCorrectSetSize2) /6"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -320, y: 161)
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "\(numOfCorrectSetSize3) /4"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -320, y: 136)
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "\(numOfCorrectSetSize4) /4"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -320, y: 108.545)
        self.addChild(setSize4Label)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "\(numOfCorrectSimpleBG) /2"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: 196.013, y: 161)
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "\(numOfCorrectLineBG) /4"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: 196.013, y: 132.553)
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "\(numOfCorrectSceneBG) /4"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: 196.013, y: 107.541)
        self.addChild(sceneBGLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for play again button
        let playAgainButton = self.childNode(withName: "play again button")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if retry button is touched
        if playAgainButton!.contains(touch.location(in: self)) {
            
            // reset all game-wide stats
            numOfCorrectSetSize2 = 0
            numOfCorrectSetSize3 = 0
            numOfCorrectSetSize4 = 0
            numOfCorrectSimpleBG = 0
            numOfCorrectLineBG = 0
            numOfCorrectSceneBG = 0
            incorrectTouches = 0
            correctTouches = 0
            
            // transition scene back to start
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }
    }
}

