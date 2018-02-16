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
    let totalSetSizeLabel = SKLabelNode(fontNamed: "Calibri")
    let setSize2Label = SKLabelNode(fontNamed: "Calibri")
    let setSize3Label = SKLabelNode(fontNamed: "Calibri")
    let setSize4Label = SKLabelNode(fontNamed: "Calibri")
    let totalBGTypeLabel = SKLabelNode(fontNamed: "Calibri")
    let simpleBGLabel = SKLabelNode(fontNamed: "Calibri")
    let lineBGLabel = SKLabelNode(fontNamed: "Calibri")
    let sceneBGLabel = SKLabelNode(fontNamed: "Calibri")
    
    let correctFirstTriesArrayLabel = SKLabelNode(fontNamed:"Calibri")
    let correctTouchesArrayLabel = SKLabelNode(fontNamed: "Calibri")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let setSizeBreakdownLabel = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize2Label = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize3Label = SKLabelNode(fontNamed: "Calibri")
    let correctSetSize4Label = SKLabelNode(fontNamed: "Calibri")
    let bgTypeBreakdownLabel = SKLabelNode(fontNamed: "Calibri")
    let correctBGSimpleLabel = SKLabelNode(fontNamed: "Calibri")
    let correctBGLineLabel = SKLabelNode(fontNamed: "Calibri")
    let correctBGSceneLabel = SKLabelNode(fontNamed: "Calibri")

    override func didMove(to view: SKView) {
        
        // place correct first try screens  
        correctFirstTryLabel.text = "1. Number of scenes with correct first time: \(numOfCorrectFirstTry) / 18"
        correctFirstTryLabel.fontSize = 20
        correctFirstTryLabel.position = CGPoint(x: -379, y: 335.618)
        correctFirstTryLabel.zPosition = 10
        correctFirstTryLabel.fontColor = UIColor.black
        correctFirstTryLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctFirstTryLabel)

        // place correct score on screen
        correctScoreLabel.text = "2. Number of scenes correct: \(correctTouches) / 18"
        correctScoreLabel.fontSize = 20
        correctScoreLabel.position = CGPoint(x: -379, y: 295.618)
        correctScoreLabel.zPosition = 10
        correctScoreLabel.fontColor = UIColor.black
        correctScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctScoreLabel)
        
        // place incorrect score on screen
        incorrectScoreLabel.text = "3. Number of incorrect touches: \(incorrectTouches)"
        incorrectScoreLabel.fontSize = 20
        incorrectScoreLabel.position = CGPoint(x: -379, y: 257.11)
        incorrectScoreLabel.zPosition = 10
        incorrectScoreLabel.fontColor = UIColor.black
        incorrectScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(incorrectScoreLabel)
        
        totalSetSizeLabel.text = "4. # correct by scene size"
        totalSetSizeLabel.fontSize = 20
        totalSetSizeLabel.position = CGPoint(x: -379, y: 208.493)
        totalSetSizeLabel.zPosition = 10
        totalSetSizeLabel.fontColor = UIColor.black
        totalSetSizeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalSetSizeLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "2: \(numOfCorrectSetSize2) / 6"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -336, y: 181)
        setSize2Label.zPosition = 10
        setSize2Label.fontColor = UIColor.black
        setSize2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "3: \(numOfCorrectSetSize3) / 6"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -336, y: 149)
        setSize3Label.zPosition = 10
        setSize3Label.fontColor = UIColor.black
        setSize3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "4: \(numOfCorrectSetSize4) / 6"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -336, y: 116.257)
        setSize4Label.zPosition = 10
        setSize4Label.fontColor = UIColor.black
        setSize4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize4Label)
        
        totalBGTypeLabel.text = "5. # correct by background type"
        totalBGTypeLabel.fontSize = 20
        totalBGTypeLabel.position = CGPoint(x: 36.039, y: 208.493)
        totalBGTypeLabel.zPosition = 10
        totalBGTypeLabel.fontColor = UIColor.black
        totalBGTypeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalBGTypeLabel)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "Simple: \(numOfCorrectSimpleBG) / 6"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: 79.039, y: 181)
        simpleBGLabel.zPosition = 10
        simpleBGLabel.fontColor = UIColor.black
        simpleBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "Line:     \(numOfCorrectLineBG) / 6"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: 79.039, y: 149)
        lineBGLabel.zPosition = 10
        lineBGLabel.fontColor = UIColor.black
        lineBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "Scene: \(numOfCorrectSceneBG) / 6"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: 79.039, y: 116.257)
        sceneBGLabel.zPosition = 10
        sceneBGLabel.fontColor = UIColor.black
        sceneBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(sceneBGLabel)
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            correctFirstTriesArrayLabel.text = "1. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            correctFirstTriesArrayLabel.text = "1. Scenes w/ correct first time: n/a"
        }
        correctFirstTriesArrayLabel.fontSize = 20
        correctFirstTriesArrayLabel.position = CGPoint(x: -379, y: -67)
        correctFirstTriesArrayLabel.zPosition = 10
        correctFirstTriesArrayLabel.fontColor = UIColor.black
        correctFirstTriesArrayLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        correctFirstTriesArrayLabel.preferredMaxLayoutWidth = 850
        correctFirstTriesArrayLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        correctFirstTriesArrayLabel.numberOfLines = 0
        correctFirstTriesArrayLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(correctFirstTriesArrayLabel)
        
        // place list of scenes correct
        let correctJoined = correctTouchesArray.joined(separator: ", ")
        if correctTouchesArray.count > 0 {
            correctTouchesArrayLabel.text = "2. Scenes correct: \(correctJoined)"
        }
        else {
            correctTouchesArrayLabel.text = "2. Scenes correct: n/a"
        }
        correctTouchesArrayLabel.fontSize = 20
        correctTouchesArrayLabel.position = CGPoint(x: -379, y: -125.739)
        correctTouchesArrayLabel.zPosition = 10
        correctTouchesArrayLabel.fontColor = UIColor.black
        correctTouchesArrayLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        correctTouchesArrayLabel.preferredMaxLayoutWidth = 850
        correctTouchesArrayLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        correctTouchesArrayLabel.numberOfLines = 0
        correctTouchesArrayLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(correctTouchesArrayLabel)
        
        // place dictionary of incorrect touches per scene
        numIncorrectPerSceneLabel.text = "3. # of incorrect touches per scene:"
        numIncorrectPerSceneLabel.fontSize = 20
        numIncorrectPerSceneLabel.position = CGPoint(x: -379, y: -205)
        numIncorrectPerSceneLabel.zPosition = 10
        numIncorrectPerSceneLabel.fontColor = UIColor.black
        numIncorrectPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(numIncorrectPerSceneLabel)
        
        setSizeBreakdownLabel.text = "4. Correct scenes by scene size"
        setSizeBreakdownLabel.fontSize = 20
        setSizeBreakdownLabel.position = CGPoint(x: -379, y: -272.028)
        setSizeBreakdownLabel.zPosition = 10
        setSizeBreakdownLabel.fontColor = UIColor.black
        setSizeBreakdownLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSizeBreakdownLabel)
        
        // place list of size 2 correct
        let size2Joined = correctSetSize2.joined(separator: ", ")
        if correctSetSize2.count > 0 {
            correctSetSize2Label.text = "2: \(size2Joined)"
        }
        else {
            correctSetSize2Label.text = "2: n/a"
        }
        correctSetSize2Label.fontSize = 20
        correctSetSize2Label.position = CGPoint(x: -350, y: -297.028)
        correctSetSize2Label.zPosition = 10
        correctSetSize2Label.fontColor = UIColor.black
        correctSetSize2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctSetSize2Label)
        
        // place list of size 3 correct
        let size3Joined = correctSetSize3.joined(separator: ", ")
        if correctSetSize3.count > 0 {
            correctSetSize3Label.text = "3: \(size3Joined)"
        }
        else {
            correctSetSize3Label.text = "3: n/a"
        }
        correctSetSize3Label.fontSize = 20
        correctSetSize3Label.position = CGPoint(x: -350, y: -335.918)
        correctSetSize3Label.zPosition = 10
        correctSetSize3Label.fontColor = UIColor.black
        correctSetSize3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctSetSize3Label)
        
        // place list of size 4 correct
        let size4Joined = correctSetSize4.joined(separator: ", ")
        if correctSetSize4.count > 0 {
            correctSetSize4Label.text = "4: \(size4Joined)"
        }
        else {
            correctSetSize4Label.text = "4: n/a"
        }
        correctSetSize4Label.fontSize = 20
        correctSetSize4Label.position = CGPoint(x: -350, y: -375.403)
        correctSetSize4Label.zPosition = 10
        correctSetSize4Label.fontColor = UIColor.black
        correctSetSize4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctSetSize4Label)
        
        bgTypeBreakdownLabel.text = "5. Correct scenes by background type: "
        bgTypeBreakdownLabel.fontSize = 20
        bgTypeBreakdownLabel.position = CGPoint(x: 36.039, y: -272.028)
        bgTypeBreakdownLabel.zPosition = 10
        bgTypeBreakdownLabel.fontColor = UIColor.black
        bgTypeBreakdownLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(bgTypeBreakdownLabel)
        
        // place list of bg simple correct
        let bgSimpleJoined = correctBGSimple.joined(separator: ", ")
        if correctBGSimple.count > 0 {
            correctBGSimpleLabel.text = "Simple: \(bgSimpleJoined)"
        }
        else {
            correctBGSimpleLabel.text = "Simple: n/a"
        }
        correctBGSimpleLabel.fontSize = 20
        correctBGSimpleLabel.position = CGPoint(x: 61.039, y: -297.028)
        correctBGSimpleLabel.zPosition = 10
        correctBGSimpleLabel.fontColor = UIColor.black
        correctBGSimpleLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctBGSimpleLabel)
        
        // place list of bg line correct
        let bgLineJoined = correctBGLine.joined(separator: ", ")
        if correctBGLine.count > 0 {
            correctBGLineLabel.text = "Line: \(bgLineJoined)"
        }
        else {
            correctBGLineLabel.text = "Line: n/a"
        }
        correctBGLineLabel.fontSize = 20
        correctBGLineLabel.position = CGPoint(x: 61.039, y: -335.919)
        correctBGLineLabel.zPosition = 10
        correctBGLineLabel.fontColor = UIColor.black
        correctBGLineLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(correctBGLineLabel)
        
        // place list of bg scene correct
        let bgSceneJoined = correctBGScene.joined(separator: ", ")
        if correctBGScene.count > 0 {
            correctBGSceneLabel.text = "Scene: \(bgSceneJoined)"
        }
        else {
            correctBGSceneLabel.text = "Scene: n/a"
        }
        correctBGSceneLabel.fontSize = 20
        correctBGSceneLabel.position = CGPoint(x: 61.039, y: -375.403)
        correctBGSceneLabel.zPosition = 10
        correctBGSceneLabel.fontColor = UIColor.black
        correctBGSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
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
            numOfCorrectFirstTry = 0
            
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

