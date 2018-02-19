//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

//PUBLIC VARIABLES TO KEEP TRACK OF STATISTICS//
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
var accuracyPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]

class ScoreScene: SKScene {
    //LOCAL VARIABLES FOR LABELS//
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
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Calibri")

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
        setSize2Label.position = CGPoint(x: -410, y: 244.874)
        setSize2Label.zPosition = 10
        setSize2Label.fontColor = UIColor.black
        setSize2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "3: \(threeItemCorrectFT) / 6"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -410, y: 211.611)
        setSize3Label.zPosition = 10
        setSize3Label.fontColor = UIColor.black
        setSize3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "4: \(fourItemCorrectFT) / 6"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -410, y: 173)
        setSize4Label.zPosition = 10
        setSize4Label.fontColor = UIColor.black
        setSize4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize4Label)
        
        totalCorrectByBgTypeLabel.text = "3. # correct by background type"
        totalCorrectByBgTypeLabel.fontSize = 20
        totalCorrectByBgTypeLabel.position = CGPoint(x: -457, y: 143.56)
        totalCorrectByBgTypeLabel.zPosition = 10
        totalCorrectByBgTypeLabel.fontColor = UIColor.black
        totalCorrectByBgTypeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectByBgTypeLabel)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "Simple: \(simpleCorrectFT) / 6"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: -410, y: 117.56)
        simpleBGLabel.zPosition = 10
        simpleBGLabel.fontColor = UIColor.black
        simpleBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "Line:      \(lineCorrectFT) / 6"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: -410, y: 80.676)
        lineBGLabel.zPosition = 10
        lineBGLabel.fontColor = UIColor.black
        lineBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "Scene:   \(sceneCorrectFT) / 6"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: -410, y: 42)
        sceneBGLabel.zPosition = 10
        sceneBGLabel.fontColor = UIColor.black
        sceneBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(sceneBGLabel)
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            listCorrectFTLabel.text = "4. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            listCorrectFTLabel.text = "4. Scenes w/ correct first time: n/a"
        }
        listCorrectFTLabel.fontSize = 20
        listCorrectFTLabel.position = CGPoint(x: -457, y: 0)
        listCorrectFTLabel.zPosition = 10
        listCorrectFTLabel.fontColor = UIColor.black
        listCorrectFTLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        listCorrectFTLabel.preferredMaxLayoutWidth = 850
        listCorrectFTLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        listCorrectFTLabel.numberOfLines = 0
        listCorrectFTLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(listCorrectFTLabel)
        
        // place dictionary of correct touches per scene
        var correctDictionary = "5. # of correct touches per scene: "
        correctDictionary.append("rock: \(numCorrectPerScene["rock"]!), ")
        correctDictionary.append("lamp: \(numCorrectPerScene["lamp"]!), ")
        correctDictionary.append("cat: \(numCorrectPerScene["cat"]!), ")
        correctDictionary.append("lion: \(numCorrectPerScene["lion"]!), ")
        correctDictionary.append("hand: \(numCorrectPerScene["hand"]!), ")
        correctDictionary.append("rain: \(numCorrectPerScene["rain"]!), ")
        correctDictionary.append("duck: \(numCorrectPerScene["duck"]!), ")
        correctDictionary.append("moon: \(numCorrectPerScene["moon"]!), ")
        correctDictionary.append("cow: \(numCorrectPerScene["cow"]!), ")
        correctDictionary.append("trash: \(numCorrectPerScene["trash"]!), ")
        correctDictionary.append("airplane: \(numCorrectPerScene["airplane"]!), ")
        correctDictionary.append("shoes: \(numCorrectPerScene["shoes"]!), ")
        correctDictionary.append("cake: \(numCorrectPerScene["cake"]!), ")
        correctDictionary.append("stroller: \(numCorrectPerScene["stroller"]!), ")
        correctDictionary.append("toast: \(numCorrectPerScene["toast"]!), ")
        correctDictionary.append("hat: \(numCorrectPerScene["hat"]!), ")
        correctDictionary.append("cookie: \(numCorrectPerScene["cookie"]!), ")
        correctDictionary.append("mouse: \(numCorrectPerScene["mouse"]!) ")
        numCorrectPerSceneLabel.text = correctDictionary
        numCorrectPerSceneLabel.fontSize = 20
        numCorrectPerSceneLabel.position = CGPoint(x: -457, y: -75)
        numCorrectPerSceneLabel.zPosition = 10
        numCorrectPerSceneLabel.fontColor = UIColor.black
        numCorrectPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        numCorrectPerSceneLabel.preferredMaxLayoutWidth = 850
        numCorrectPerSceneLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        numCorrectPerSceneLabel.numberOfLines = 0
        numCorrectPerSceneLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(numCorrectPerSceneLabel)
        
        // place dictionary of incorrect touches per scene
        var incorrectDictionary = "6. # of incorrect touches per scene: "
        incorrectDictionary.append("rock: \(numIncorrectPerScene["rock"]!), ")
        incorrectDictionary.append("lamp: \(numIncorrectPerScene["lamp"]!), ")
        incorrectDictionary.append("cat: \(numIncorrectPerScene["cat"]!), ")
        incorrectDictionary.append("lion: \(numIncorrectPerScene["lion"]!), ")
        incorrectDictionary.append("hand: \(numIncorrectPerScene["hand"]!), ")
        incorrectDictionary.append("rain: \(numIncorrectPerScene["rain"]!), ")
        incorrectDictionary.append("duck: \(numIncorrectPerScene["duck"]!), ")
        incorrectDictionary.append("moon: \(numIncorrectPerScene["moon"]!), ")
        incorrectDictionary.append("cow: \(numIncorrectPerScene["cow"]!), ")
        incorrectDictionary.append("trash: \(numIncorrectPerScene["trash"]!), ")
        incorrectDictionary.append("airplane: \(numIncorrectPerScene["airplane"]!), ")
        incorrectDictionary.append("shoes: \(numIncorrectPerScene["shoes"]!), ")
        incorrectDictionary.append("cake: \(numIncorrectPerScene["cake"]!), ")
        incorrectDictionary.append("stroller: \(numIncorrectPerScene["stroller"]!), ")
        incorrectDictionary.append("toast: \(numIncorrectPerScene["toast"]!), ")
        incorrectDictionary.append("hat: \(numIncorrectPerScene["hat"]!), ")
        incorrectDictionary.append("cookie: \(numIncorrectPerScene["cookie"]!), ")
        incorrectDictionary.append("mouse: \(numIncorrectPerScene["mouse"]!) ")
        numIncorrectPerSceneLabel.text = incorrectDictionary
        numIncorrectPerSceneLabel.fontSize = 20
        numIncorrectPerSceneLabel.position = CGPoint(x: -457, y: -150)
        numIncorrectPerSceneLabel.zPosition = 10
        numIncorrectPerSceneLabel.fontColor = UIColor.black
        numIncorrectPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        numIncorrectPerSceneLabel.preferredMaxLayoutWidth = 850
        numIncorrectPerSceneLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        numIncorrectPerSceneLabel.numberOfLines = 0
        numIncorrectPerSceneLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(numIncorrectPerSceneLabel)
        
        // Calculations for accuracy per scene
        accuracyPerScene["rock"] = numCorrectPerScene["rock"]!/numIncorrectPerScene["rock"]!
        accuracyPerScene["lamp"] = numCorrectPerScene["lamp"]!/numIncorrectPerScene["lamp"]!
        accuracyPerScene["cat"] = numCorrectPerScene["cat"]!/numIncorrectPerScene["cat"]!
        accuracyPerScene["lion"] = numCorrectPerScene["lion"]!/numIncorrectPerScene["lion"]!
        accuracyPerScene["hand"] = numCorrectPerScene["hand"]!/numIncorrectPerScene["hand"]!
        accuracyPerScene["rain"] = numCorrectPerScene["rain"]!/numIncorrectPerScene["rain"]!
        accuracyPerScene["duck"] = numCorrectPerScene["duck"]!/numIncorrectPerScene["duck"]!
        accuracyPerScene["moon"] = numCorrectPerScene["moon"]!/numIncorrectPerScene["moon"]!
        accuracyPerScene["cow"] = numCorrectPerScene["cow"]!/numIncorrectPerScene["cow"]!
        accuracyPerScene["trash"] = numCorrectPerScene["trash"]!/numIncorrectPerScene["trash"]!
        accuracyPerScene["airplane"] = numCorrectPerScene["airplane"]!/numIncorrectPerScene["airplane"]!
        accuracyPerScene["shoes"] = numCorrectPerScene["shoes"]!/numIncorrectPerScene["shoes"]!
        accuracyPerScene["cake"] = numCorrectPerScene["cake"]!/numIncorrectPerScene["cake"]!
        accuracyPerScene["stoller"] = numCorrectPerScene["stroller"]!/numIncorrectPerScene["stroller"]!
        accuracyPerScene["toast"] = numCorrectPerScene["toast"]!/numIncorrectPerScene["toast"]!
        accuracyPerScene["hat"] = numCorrectPerScene["hat"]!/numIncorrectPerScene["hat"]!
        accuracyPerScene["cookie"] = numCorrectPerScene["cookie"]!/numIncorrectPerScene["cookie"]!
        accuracyPerScene["mouse"] = numCorrectPerScene["mouse"]!/numIncorrectPerScene["mouse"]!
        
        // place label for accuracy per scene dictionary
        var accuracyDictionary = "7. Accuracy per scene: "
        accuracyDictionary.append("rock: \(accuracyPerScene["rock"]!), ")
        accuracyDictionary.append("lamp: \(accuracyPerScene["lamp"]!), ")
        accuracyDictionary.append("cat: \(accuracyPerScene["cat"]!), ")
        accuracyDictionary.append("lion: \(accuracyPerScene["lion"]!), ")
        accuracyDictionary.append("hand: \(accuracyPerScene["hand"]!), ")
        accuracyDictionary.append("rain: \(accuracyPerScene["rain"]!), ")
        accuracyDictionary.append("duck: \(accuracyPerScene["duck"]!), ")
        accuracyDictionary.append("moon: \(accuracyPerScene["moon"]!), ")
        accuracyDictionary.append("cow: \(accuracyPerScene["cow"]!), ")
        accuracyDictionary.append("trash: \(accuracyPerScene["trash"]!), ")
        accuracyDictionary.append("airplane: \(accuracyPerScene["airplane"]!), ")
        accuracyDictionary.append("shoes: \(accuracyPerScene["shoes"]!), ")
        accuracyDictionary.append("cake: \(accuracyPerScene["cake"]!), ")
        accuracyDictionary.append("stroller: \(accuracyPerScene["stroller"]!), ")
        accuracyDictionary.append("toast: \(accuracyPerScene["toast"]!), ")
        accuracyDictionary.append("hat: \(accuracyPerScene["hat"]!), ")
        accuracyDictionary.append("cookie: \(accuracyPerScene["cookie"]!), ")
        accuracyDictionary.append("mouse: \(accuracyPerScene["mouse"]!) ")
        accuracyPerSceneLabel.text = accuracyDictionary
        accuracyPerSceneLabel.fontSize = 20
        accuracyPerSceneLabel.position = CGPoint(x: -457, y: -225)
        accuracyPerSceneLabel.zPosition = 10
        accuracyPerSceneLabel.fontColor = UIColor.black
        accuracyPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        accuracyPerSceneLabel.preferredMaxLayoutWidth = 850
        accuracyPerSceneLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        accuracyPerSceneLabel.numberOfLines = 0
        accuracyPerSceneLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(accuracyPerSceneLabel)
    }

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

