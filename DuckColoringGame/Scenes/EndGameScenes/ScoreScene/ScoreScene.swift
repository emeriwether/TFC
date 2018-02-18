//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

/////////////////////////////////////////////////////////////////
//********PUBLIC VARIABLES TO KEEP TRACK OF STATISTICS*********//
/////////////////////////////////////////////////////////////////
    ///// Totals ///////////
    var totalCorrectFT = 0
    var twoItemCorrectFT = 0
    var threeItemCorrectFT = 0
    var fourItemCorrectFT = 0
    var simpleCorrectFT = 0
    var lineCorrectFT = 0
    var sceneCorrectFT = 0

    ////// Scene Breakdowns ////////////////
    var correctFirstTriesArray = [String]()
    var numCorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
    var numIncorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
/////////////////////////////////////////////////////////////////
//////////********************END********************////////////
/////////////////////////////////////////////////////////////////

class ScoreScene: SKScene {
    /////////////////////////////////////////////////////////////////
    //////////********LOCAL VARIABLES FOR LABELS*********////////////
    /////////////////////////////////////////////////////////////////
        ///// Totals ///////////
        let totalCorrectFTLabel = SKLabelNode(fontNamed:"Calibri")
        let totalCorrectBySetSizeLabel = SKLabelNode(fontNamed: "Calibri")
        let setSize2Label = SKLabelNode(fontNamed: "Calibri")
        let setSize3Label = SKLabelNode(fontNamed: "Calibri")
        let setSize4Label = SKLabelNode(fontNamed: "Calibri")
        let totalCorrectByBgTypeLabel = SKLabelNode(fontNamed: "Calibri")
        let simpleBGLabel = SKLabelNode(fontNamed: "Calibri")
        let lineBGLabel = SKLabelNode(fontNamed: "Calibri")
        let sceneBGLabel = SKLabelNode(fontNamed: "Calibri")
    
        ////// Scene Breakdowns ////////////////
        let listCorrectFTLabel = SKLabelNode(fontNamed:"Calibri")
        let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
        let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    /////////////////////////////////////////////////////////////////
    //////////////////////********END*********///////////////////////
    /////////////////////////////////////////////////////////////////

    override func didMove(to view: SKView) {
        
        // place label for total scenes with correct first try
        totalCorrectFTLabel.text = "1. Number of scenes with correct first time: \(totalCorrectFT) / 18"
        totalCorrectFTLabel.fontSize = 20
        totalCorrectFTLabel.position = CGPoint(x: -457, y: 321)
        totalCorrectFTLabel.zPosition = 10
        totalCorrectFTLabel.fontColor = UIColor.black
        totalCorrectFTLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectFTLabel)
        
        totalCorrectBySetSizeLabel.text = "2. # correct by scene size"
        totalCorrectBySetSizeLabel.fontSize = 20
        totalCorrectBySetSizeLabel.position = CGPoint(x: -457, y: 271.343)
        totalCorrectBySetSizeLabel.zPosition = 10
        totalCorrectBySetSizeLabel.fontColor = UIColor.black
        totalCorrectBySetSizeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectBySetSizeLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "2: \(twoItemCorrectFT) / 6"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -336, y: 181)
        setSize2Label.zPosition = 10
        setSize2Label.fontColor = UIColor.black
        setSize2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "3: \(threeItemCorrectFT) / 6"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -336, y: 149)
        setSize3Label.zPosition = 10
        setSize3Label.fontColor = UIColor.black
        setSize3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "4: \(fourItemCorrectFT) / 6"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -336, y: 116.257)
        setSize4Label.zPosition = 10
        setSize4Label.fontColor = UIColor.black
        setSize4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize4Label)
        
        totalCorrectByBgTypeLabel.text = "5. # correct by background type"
        totalCorrectByBgTypeLabel.fontSize = 20
        totalCorrectByBgTypeLabel.position = CGPoint(x: 36.039, y: 208.493)
        totalCorrectByBgTypeLabel.zPosition = 10
        totalCorrectByBgTypeLabel.fontColor = UIColor.black
        totalCorrectByBgTypeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectByBgTypeLabel)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "Simple: \(simpleCorrectFT) / 6"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: 79.039, y: 181)
        simpleBGLabel.zPosition = 10
        simpleBGLabel.fontColor = UIColor.black
        simpleBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "Line:     \(lineCorrectFT) / 6"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: 79.039, y: 149)
        lineBGLabel.zPosition = 10
        lineBGLabel.fontColor = UIColor.black
        lineBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "Scene: \(sceneCorrectFT) / 6"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: 79.039, y: 116.257)
        sceneBGLabel.zPosition = 10
        sceneBGLabel.fontColor = UIColor.black
        sceneBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(sceneBGLabel)
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            totalCorrectFTLabel.text = "1. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            totalCorrectFTLabel.text = "1. Scenes w/ correct first time: n/a"
        }
        totalCorrectFTLabel.fontSize = 20
        totalCorrectFTLabel.position = CGPoint(x: -379, y: -67)
        totalCorrectFTLabel.zPosition = 10
        totalCorrectFTLabel.fontColor = UIColor.black
        totalCorrectFTLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        totalCorrectFTLabel.preferredMaxLayoutWidth = 850
        totalCorrectFTLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        totalCorrectFTLabel.numberOfLines = 0
        totalCorrectFTLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(totalCorrectFTLabel)
        
        // place dictionary of incorrect touches per scene
        var printedDictionary = "3. # of incorrect touches per scene: "
        printedDictionary.append("rock: \(numIncorrectPerScene["rock"]!), ")
        printedDictionary.append("lamp: \(numIncorrectPerScene["lamp"]!), ")
        printedDictionary.append("cat: \(numIncorrectPerScene["cat"]!), ")
        printedDictionary.append("lion: \(numIncorrectPerScene["lion"]!), ")
        printedDictionary.append("hand: \(numIncorrectPerScene["hand"]!), ")
        printedDictionary.append("rain: \(numIncorrectPerScene["rain"]!), ")
        printedDictionary.append("duck: \(numIncorrectPerScene["duck"]!), ")
        printedDictionary.append("moon: \(numIncorrectPerScene["moon"]!), ")
        printedDictionary.append("cow: \(numIncorrectPerScene["cow"]!), ")
        printedDictionary.append("trash: \(numIncorrectPerScene["trash"]!), ")
        printedDictionary.append("airplane: \(numIncorrectPerScene["airplane"]!), ")
        printedDictionary.append("shoes: \(numIncorrectPerScene["shoes"]!), ")
        printedDictionary.append("cake: \(numIncorrectPerScene["cake"]!), ")
        printedDictionary.append("stroller: \(numIncorrectPerScene["stroller"]!), ")
        printedDictionary.append("toast: \(numIncorrectPerScene["toast"]!), ")
        printedDictionary.append("hat: \(numIncorrectPerScene["hat"]!), ")
        printedDictionary.append("cookie: \(numIncorrectPerScene["cookie"]!), ")
        printedDictionary.append("mouse: \(numIncorrectPerScene["mouse"]!), ")
        numIncorrectPerSceneLabel.text = printedDictionary
        numIncorrectPerSceneLabel.fontSize = 20
        numIncorrectPerSceneLabel.position = CGPoint(x: -379, y: -180)
        numIncorrectPerSceneLabel.zPosition = 10
        numIncorrectPerSceneLabel.fontColor = UIColor.black
        numIncorrectPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        numIncorrectPerSceneLabel.preferredMaxLayoutWidth = 850
        numIncorrectPerSceneLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        numIncorrectPerSceneLabel.numberOfLines = 0
        numIncorrectPerSceneLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(numIncorrectPerSceneLabel)
        

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for play again button
        let playAgainButton = self.childNode(withName: "play again button")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if retry button is touched
        if playAgainButton!.contains(touch.location(in: self)) {
            
            //////////////////////////////////////////////////
            //////// RESET ALL GAMEWIDE STATS ////////////////
            //////////////////////////////////////////////////
            totalCorrectFT = 0
            twoItemCorrectFT = 0
            threeItemCorrectFT = 0
            fourItemCorrectFT = 0
            simpleCorrectFT = 0
            lineCorrectFT = 0
            sceneCorrectFT = 0
            
            correctFirstTriesArray.removeAll()
            for (scene, numCorrect) in numCorrectPerScene {
                numCorrectPerScene[scene] = 0
            }
            for (scene, numIncorrect) in numIncorrectPerScene {
                numIncorrectPerScene[scene] = 0
            }

            //////////////////////////////////////////////////
            ///////////////// END ////////////////////////////
            //////////////////////////////////////////////////
            
            // transition scene back to start
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }
    }
}

