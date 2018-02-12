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
var correctTouches = 0
var incorrectTouches = 0
var numOfCorrectSetSize2 = 0
var numOfCorrectSetSize3 = 0
var numOfCorrectSetSize4 = 0
var numOfCorrectSimpleBG = 0
var numOfCorrectLineBG = 0
var numOfCorrectSceneBG = 0

var correctFirstTriesArray = [String]()
var correctTouchesArray = [String]()
var numIncorrectPerScene = [String:Int]()
var correctSetSize2 = [String]()
var correctSetSize3 = [String]()
var correctSetSize4 = [String]()
var correctBGSimple = [String]()
var correctBGLine = [String]()
var correctBGScene = [String]()

class ScoreScene: SKScene {
    // local variables
    let correctFirstTryLabel = SKLabelNode(fontNamed:"Calibri")
    let incorrectScoreLabel = SKLabelNode(fontNamed: "Calibri")
    let correctScoreLabel = SKLabelNode(fontNamed: "Calibri")
    let setSizeLabel = SKLabelNode(fontNamed: "Calibri")
    let setSize2Label = SKLabelNode(fontNamed: "Calibri")
    let setSize3Label = SKLabelNode(fontNamed: "Calibri")
    let setSize4Label = SKLabelNode(fontNamed: "Calibri")
    let bgTypeLabel = SKLabelNode(fontNamed: "Calibri")
    let simpleBGLabel = SKLabelNode(fontNamed: "Calibri")
    let lineBGLabel = SKLabelNode(fontNamed: "Calibri")
    let sceneBGLabel = SKLabelNode(fontNamed: "Calibri")
    
    let correctFirstTriesArrayLabel = SKLabelNode(fontNamed:"Calibri")
    let correctTouchesArrayLabel = SKLabelNode(fontNamed: "Calibri")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize2Label = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize3Label = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize4Label = SKLabelNode(fontNamed: "Calibri")
    let correctBGSimpleLabel = SKLabelNode(fontNamed: "Calibri")
    let correctBGLineLabel = SKLabelNode(fontNamed: "Calibri")
    let correctBGSceneLabel = SKLabelNode(fontNamed: "Calibri")

    override func didMove(to view: SKView) {
        
        // place correct first try screens  
        correctFirstTryLabel.text = "Number of scenes with correct first time: \(numOfCorrectFirstTry) / 16"
        correctFirstTryLabel.fontSize = 20
        correctFirstTryLabel.position = CGPoint(x: 15, y: 332.037)
        correctFirstTryLabel.zPosition = 10
        correctFirstTryLabel.fontColor = UIColor.black
        self.addChild(correctFirstTryLabel)

        // place correct score on screen
        correctScoreLabel.text = "Number of scenes correct: \(correctTouches) / 16"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -123.047, y: 306)
        correctScoreLabel.zPosition = 10
        correctScoreLabel.fontColor = UIColor.black
        self.addChild(correctScoreLabel)
        
        // place incorrect score on screen
        incorrectScoreLabel.text = "Number of incorrect touches \(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -90.999, y: 280.113)
        incorrectScoreLabel.zPosition = 10
        incorrectScoreLabel.fontColor = UIColor.black
        self.addChild(incorrectScoreLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "  \(numOfCorrectSetSize2) / 6"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -318, y: 161)
        setSize2Label.zPosition = 10
        setSize2Label.fontColor = UIColor.black
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "  \(numOfCorrectSetSize3) / 4"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -318, y: 136)
        setSize3Label.zPosition = 10
        setSize3Label.fontColor = UIColor.black
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "  \(numOfCorrectSetSize4) / 4"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -318, y: 108.545)
        setSize4Label.zPosition = 10
        setSize4Label.fontColor = UIColor.black
        self.addChild(setSize4Label)
        
        // place correct score in simple bg type
        simpleBGLabel.text = " \(numOfCorrectSimpleBG) / 2"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: 196.013, y: 161)
        simpleBGLabel.zPosition = 10
        simpleBGLabel.fontColor = UIColor.black
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = " \(numOfCorrectLineBG) / 4"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: 196.013, y: 132.553)
        lineBGLabel.zPosition = 10
        lineBGLabel.fontColor = UIColor.black
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = " \(numOfCorrectSceneBG) / 4"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: 196.013, y: 107.541)
        sceneBGLabel.zPosition = 10
        sceneBGLabel.fontColor = UIColor.black
        self.addChild(sceneBGLabel)
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            correctFirstTriesArrayLabel.text = "\(correctFTjoined)"
        }
        else {
            correctFirstTriesArrayLabel.text = "n/a"
        }
        correctFirstTriesArrayLabel.fontSize = 20
        correctFirstTriesArrayLabel.position = CGPoint(x: -60.999, y: -129.757)
        correctFirstTriesArrayLabel.zPosition = 10
        correctFirstTriesArrayLabel.fontColor = UIColor.black
        self.addChild(correctFirstTriesArrayLabel)
        
        // place list of scenes correct
        let correctJoined = correctTouchesArray.joined(separator: ", ")
        if correctTouchesArray.count > 0 {
            correctTouchesArrayLabel.text = "\(correctJoined)"
        }
        else {
            correctTouchesArrayLabel.text = "n/a"
        }
        correctTouchesArrayLabel.fontSize = 20
        correctTouchesArrayLabel.position = CGPoint(x: -182, y: -157)
        correctTouchesArrayLabel.zPosition = 10
        correctTouchesArrayLabel.fontColor = UIColor.black
        self.addChild(correctTouchesArrayLabel)
        
        // place list of size 2 correct
        let size2Joined = correctSetSize2.joined(separator: ", ")
        if correctSetSize2.count > 0 {
            correctSetSize2Label.text = "\(size2Joined)"
        }
        else {
            correctSetSize2Label.text = "n/a"
        }
        correctSetSize2Label.fontSize = 20
        correctSetSize2Label.position = CGPoint(x: -310, y: -296.176)
        correctSetSize2Label.zPosition = 10
        correctSetSize2Label.fontColor = UIColor.black
        self.addChild(correctSetSize2Label)
        
        // place list of size 3 correct
        let size3Joined = correctSetSize3.joined(separator: ", ")
        if correctSetSize3.count > 0 {
            correctSetSize3Label.text = "\(size3Joined)"
        }
        else {
            correctSetSize3Label.text = "n/a"
        }
        correctSetSize3Label.fontSize = 20
        correctSetSize3Label.position = CGPoint(x: -310, y: -323)
        correctSetSize3Label.zPosition = 10
        correctSetSize3Label.fontColor = UIColor.black
        self.addChild(correctSetSize3Label)
        
        // place list of size 4 correct
        let size4Joined = correctSetSize4.joined(separator: ", ")
        if correctSetSize4.count > 0 {
            correctSetSize4Label.text = "\(size4Joined)"
        }
        else {
            correctSetSize4Label.text = "n/a"
        }
        correctSetSize4Label.fontSize = 20
        correctSetSize4Label.position = CGPoint(x: -310, y: -347.575)
        correctSetSize4Label.zPosition = 10
        correctSetSize4Label.fontColor = UIColor.black
        self.addChild(correctSetSize4Label)
        
        // place list of bg simple correct
        let bgSimpleJoined = correctBGSimple.joined(separator: ", ")
        if correctBGSimple.count > 0 {
            correctBGSimpleLabel.text = "\(bgSimpleJoined)"
        }
        else {
            correctBGSimpleLabel.text = "n/a"
        }
        correctBGSimpleLabel.fontSize = 20
        correctBGSimpleLabel.position = CGPoint(x: 194.438, y: -295.762)
        correctBGSimpleLabel.zPosition = 10
        correctBGSimpleLabel.fontColor = UIColor.black
        self.addChild(correctBGSimpleLabel)
        
        // place list of bg line correct
        let bgLineJoined = correctBGLine.joined(separator: ", ")
        if correctBGLine.count > 0 {
            correctBGLineLabel.text = "\(bgLineJoined)"
        }
        else {
            correctBGLineLabel.text = "n/a"
        }
        correctBGLineLabel.fontSize = 20
        correctBGLineLabel.position = CGPoint(x: 194.438, y: -324)
        correctBGLineLabel.zPosition = 10
        correctBGLineLabel.fontColor = UIColor.black
        self.addChild(correctBGLineLabel)
        
        // place list of bg scene correct
        let bgSceneJoined = correctBGScene.joined(separator: ", ")
        if correctBGScene.count > 0 {
            correctBGSceneLabel.text = "\(bgSceneJoined)"
        }
        else {
            correctBGSceneLabel.text = "n/a"
        }
        correctBGSceneLabel.fontSize = 20
        correctBGSceneLabel.position = CGPoint(x: 228.438, y: -350.5)
        correctBGSceneLabel.zPosition = 10
        correctBGSceneLabel.fontColor = UIColor.black
        self.addChild(correctBGSceneLabel)
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
            
            correctFirstTriesArray.removeAll()
            correctTouchesArray.removeAll()
            numIncorrectPerScene.removeAll()
            correctSetSize2.removeAll()
            correctSetSize3.removeAll()
            correctSetSize4.removeAll()
            correctBGSimple.removeAll()
            correctBGLine.removeAll()
            correctBGScene.removeAll()
            
            // transition scene back to start
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }
    }
}

