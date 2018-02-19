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
var totalAccuracy = 0.0

////// Scene Breakdowns ////////////////
var correctFirstTriesArray = [String]()
var numCorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
var numIncorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
var accuracyPerScene: [String:Double] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]

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
    let totalAccuracyLabel = SKLabelNode(fontNamed: "Calibri")

    ////// Scene Breakdowns ////////////////
    let listCorrectFTLabel = SKLabelNode(fontNamed:"Calibri")
    let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Calibri")

    override func didMove(to view: SKView) {
        
        // Calculations for accuracy per scene
        
        // if user skipped scene (no correct touch), (0%)
        if (numCorrectPerScene["rock"]! == 0) { accuracyPerScene["rock"] = 0 }
        // else if user made no incorrect touches (correct first try), (100%)
        else if (numIncorrectPerScene["rock"]! == 0) {accuracyPerScene["rock"] = 100 }
        // else if user touched correct, but made mistakes (1-99%)
        else {
            accuracyPerScene["rock"] = round((Double(numCorrectPerScene["rock"]!) / Double(numIncorrectPerScene["rock"]! + numCorrectPerScene["rock"]!)) * 100)
        }

        if (numCorrectPerScene["lamp"]! == 0) { accuracyPerScene["lamp"] = 0 }
        else if (numIncorrectPerScene["lamp"]! == 0) {accuracyPerScene["lamp"] = 100 }
        else {
            accuracyPerScene["lamp"] = round((Double(numCorrectPerScene["lamp"]!) / Double(numIncorrectPerScene["lamp"]! + numCorrectPerScene["lamp"]!)) * 100)
        }
        
        if (numCorrectPerScene["cat"]! == 0) { accuracyPerScene["cat"] = 0 }
        else if (numIncorrectPerScene["cat"]! == 0) {accuracyPerScene["cat"] = 100 }
        else {
            accuracyPerScene["cat"] = round((Double(numCorrectPerScene["cat"]!) / Double(numIncorrectPerScene["cat"]! + numCorrectPerScene["cat"]!)) * 100)
        }
        
        if (numCorrectPerScene["lion"]! == 0) { accuracyPerScene["lion"] = 0 }
        else if (numIncorrectPerScene["lion"]! == 0) {accuracyPerScene["lion"] = 100 }
        else {
            accuracyPerScene["lion"] = round((Double(numCorrectPerScene["lion"]!) / Double(numIncorrectPerScene["lion"]! + numCorrectPerScene["lion"]!)) * 100)
        }
        
        if (numCorrectPerScene["hand"]! == 0) { accuracyPerScene["hand"] = 0 }
        else if (numIncorrectPerScene["hand"]! == 0) {accuracyPerScene["hand"] = 100 }
        else {
            accuracyPerScene["hand"] = round((Double(numCorrectPerScene["hand"]!) / Double(numIncorrectPerScene["hand"]! + numCorrectPerScene["hand"]!)) * 100)
        }
        
        if (numCorrectPerScene["rain"]! == 0) { accuracyPerScene["rain"] = 0 }
        else if (numIncorrectPerScene["rain"]! == 0) {accuracyPerScene["rain"] = 100 }
        else {
            accuracyPerScene["rain"] = round((Double(numCorrectPerScene["rain"]!) / Double(numIncorrectPerScene["rain"]! + numCorrectPerScene["rain"]!)) * 100)
        }
        
        if (numCorrectPerScene["duck"]! == 0) { accuracyPerScene["duck"] = 0 }
        else if (numIncorrectPerScene["duck"]! == 0) {accuracyPerScene["duck"] = 100 }
        else {
            accuracyPerScene["duck"] = round((Double(numCorrectPerScene["duck"]!) / Double(numIncorrectPerScene["duck"]! + numCorrectPerScene["duck"]!)) * 100)
        }
        
        if (numCorrectPerScene["moon"]! == 0) { accuracyPerScene["moon"] = 0 }
        else if (numIncorrectPerScene["moon"]! == 0) {accuracyPerScene["moon"] = 100 }
        else {
            accuracyPerScene["moon"] = round((Double(numCorrectPerScene["moon"]!) / Double(numIncorrectPerScene["moon"]! + numCorrectPerScene["moon"]!)) * 100)
        }
        
        if (numCorrectPerScene["cow"]! == 0) { accuracyPerScene["cow"] = 0 }
        else if (numIncorrectPerScene["cow"]! == 0) {accuracyPerScene["cow"] = 100 }
        else {
            accuracyPerScene["cow"] = round((Double(numCorrectPerScene["cow"]!) / Double(numIncorrectPerScene["cow"]! + numCorrectPerScene["cow"]!)) * 100)
        }
        
        if (numCorrectPerScene["trash"]! == 0) { accuracyPerScene["trash"] = 0 }
        else if (numIncorrectPerScene["trash"]! == 0) {accuracyPerScene["trash"] = 100 }
        else {
            accuracyPerScene["trash"] = round((Double(numCorrectPerScene["trash"]!) / Double(numIncorrectPerScene["trash"]! + numCorrectPerScene["trash"]!)) * 100)
        }
        
        if (numCorrectPerScene["airplane"]! == 0) { accuracyPerScene["airplane"] = 0 }
        else if (numIncorrectPerScene["airplane"]! == 0) {accuracyPerScene["airplane"] = 100 }
        else {
            accuracyPerScene["airplane"] = round((Double(numCorrectPerScene["airplane"]!) / Double(numIncorrectPerScene["airplane"]! + numCorrectPerScene["airplane"]!)) * 100)
        }
        
        if (numCorrectPerScene["shoes"]! == 0) { accuracyPerScene["shoes"] = 0 }
        else if (numIncorrectPerScene["shoes"]! == 0) {accuracyPerScene["shoes"] = 100 }
        else {
            accuracyPerScene["shoes"] = round((Double(numCorrectPerScene["shoes"]!) / Double(numIncorrectPerScene["shoes"]! + numCorrectPerScene["shoes"]!)) * 100)
        }
        
        if (numCorrectPerScene["cake"]! == 0) { accuracyPerScene["cake"] = 0 }
        else if (numIncorrectPerScene["cake"]! == 0) {accuracyPerScene["cake"] = 100 }
        else {
            accuracyPerScene["cake"] = round((Double(numCorrectPerScene["cake"]!) / Double(numIncorrectPerScene["cake"]! + numCorrectPerScene["cake"]!)) * 100)
        }
        
        if (numCorrectPerScene["stroller"]! == 0) { accuracyPerScene["stroller"] = 0 }
        else if (numIncorrectPerScene["stroller"]! == 0) {accuracyPerScene["stroller"] = 100 }
        else {
            accuracyPerScene["stroller"] = round((Double(numCorrectPerScene["stroller"]!) / Double(numIncorrectPerScene["stroller"]! + numCorrectPerScene["stroller"]!)) * 100)
        }
        
        if (numCorrectPerScene["toast"]! == 0) { accuracyPerScene["toast"] = 0 }
        else if (numIncorrectPerScene["toast"]! == 0) {accuracyPerScene["toast"] = 100 }
        else {
            accuracyPerScene["toast"] = round((Double(numCorrectPerScene["toast"]!) / Double(numIncorrectPerScene["toast"]! + numCorrectPerScene["toast"]!)) * 100)
        }
        
        if (numCorrectPerScene["hat"]! == 0) { accuracyPerScene["hat"] = 0 }
        else if (numIncorrectPerScene["hat"]! == 0) {accuracyPerScene["hat"] = 100 }
        else {
            accuracyPerScene["hat"] = round((Double(numCorrectPerScene["hat"]!) / Double(numIncorrectPerScene["hat"]! + numCorrectPerScene["hat"]!)) * 100)
        }
        
        if (numCorrectPerScene["cookie"]! == 0) { accuracyPerScene["cookie"] = 0 }
        else if (numIncorrectPerScene["cookie"]! == 0) {accuracyPerScene["cookie"] = 100 }
        else {
            accuracyPerScene["cookie"] = round((Double(numCorrectPerScene["cookie"]!) / Double(numIncorrectPerScene["cookie"]! + numCorrectPerScene["cookie"]!)) * 100)
        }
        
        if (numCorrectPerScene["mouse"]! == 0) { accuracyPerScene["mouse"] = 0 }
        else if (numIncorrectPerScene["mouse"]! == 0) {accuracyPerScene["mouse"] = 100 }
        else {
            accuracyPerScene["mouse"] = round((Double(numCorrectPerScene["mouse"]!) / Double(numIncorrectPerScene["mouse"]! + numCorrectPerScene["mouse"]!)) * 100)
        }
        
        
        // place label for total scenes with correct first try
        totalCorrectFTLabel.text = "1. Number of scenes with correct first time: \(totalCorrectFT) / 18"
        totalCorrectFTLabel.fontSize = 20
        totalCorrectFTLabel.position = CGPoint(x: -457, y: 425)
        totalCorrectFTLabel.zPosition = 10
        totalCorrectFTLabel.fontColor = UIColor.black
        totalCorrectFTLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectFTLabel)
        
        totalCorrectBySetSizeLabel.text = "2. Scenes with correct first time, by item count"
        totalCorrectBySetSizeLabel.fontSize = 20
        totalCorrectBySetSizeLabel.position = CGPoint(x: -457, y: 375)
        totalCorrectBySetSizeLabel.zPosition = 10
        totalCorrectBySetSizeLabel.fontColor = UIColor.black
        totalCorrectBySetSizeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectBySetSizeLabel)
        
        // place correct score in set size 2 on screen
        setSize2Label.text = "2: \(twoItemCorrectFT) / 6"
        setSize2Label.fontSize = 20
        setSize2Label.position = CGPoint(x: -410, y: 345)
        setSize2Label.zPosition = 10
        setSize2Label.fontColor = UIColor.black
        setSize2Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize2Label)
        
        // place correct score in set size 3 on screen
        setSize3Label.text = "3: \(threeItemCorrectFT) / 6"
        setSize3Label.fontSize = 20
        setSize3Label.position = CGPoint(x: -410, y: 315)
        setSize3Label.zPosition = 10
        setSize3Label.fontColor = UIColor.black
        setSize3Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize3Label)

        // place correct score in set size 4 on screen
        setSize4Label.text = "4: \(fourItemCorrectFT) / 6"
        setSize4Label.fontSize = 20
        setSize4Label.position = CGPoint(x: -410, y: 285)
        setSize4Label.zPosition = 10
        setSize4Label.fontColor = UIColor.black
        setSize4Label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(setSize4Label)
        
        totalCorrectByBgTypeLabel.text = "3. Scenes with correct first time, by background type"
        totalCorrectByBgTypeLabel.fontSize = 20
        totalCorrectByBgTypeLabel.position = CGPoint(x: -457, y: 235)
        totalCorrectByBgTypeLabel.zPosition = 10
        totalCorrectByBgTypeLabel.fontColor = UIColor.black
        totalCorrectByBgTypeLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalCorrectByBgTypeLabel)
        
        // place correct score in simple bg type
        simpleBGLabel.text = "Simple: \(simpleCorrectFT)/6"
        simpleBGLabel.fontSize = 20
        simpleBGLabel.position = CGPoint(x: -410, y: 205)
        simpleBGLabel.zPosition = 10
        simpleBGLabel.fontColor = UIColor.black
        simpleBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(simpleBGLabel)
        
        // place correct score in line bg type
        lineBGLabel.text = "Line:      \(lineCorrectFT)/6"
        lineBGLabel.fontSize = 20
        lineBGLabel.position = CGPoint(x: -410, y: 175)
        lineBGLabel.zPosition = 10
        lineBGLabel.fontColor = UIColor.black
        lineBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(lineBGLabel)
        
        // place correct score in scene bg type
        sceneBGLabel.text = "Scene:   \(sceneCorrectFT)/6"
        sceneBGLabel.fontSize = 20
        sceneBGLabel.position = CGPoint(x: -410, y: 145)
        sceneBGLabel.zPosition = 10
        sceneBGLabel.fontColor = UIColor.black
        sceneBGLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(sceneBGLabel)
        
        // calculate and place total average accuracy label
        for (scene, accuracy) in accuracyPerScene {
            totalAccuracy += accuracy
        }
        totalAccuracy = totalAccuracy / 18
        totalAccuracyLabel.text = "Total accuracy: \(Int(round(totalAccuracy)))%"
        totalAccuracyLabel.fontSize = 20
        totalAccuracyLabel.position = CGPoint(x: -457, y: 95)
        totalAccuracyLabel.zPosition = 10
        totalAccuracyLabel.fontColor = UIColor.black
        totalAccuracyLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(totalAccuracyLabel)
        
        
        // place accuracy by item count label
        
        // place 2 item accuracy label
        
        // place 3 item accuracy label
        
        // place 4 item accuracy label
        
        // place accuracy by background type label
        
        // place simple bg accuracy label
        
        // place line bg accuracy level
        
        // place scene bg accuracy level
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            listCorrectFTLabel.text = "4. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            listCorrectFTLabel.text = "4. Scenes w/ correct first time: n/a"
        }
        listCorrectFTLabel.fontSize = 20
        listCorrectFTLabel.position = CGPoint(x: -457, y: -50)
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
        numCorrectPerSceneLabel.position = CGPoint(x: -457, y: -125)
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
        numIncorrectPerSceneLabel.position = CGPoint(x: -457, y: -200)
        numIncorrectPerSceneLabel.zPosition = 10
        numIncorrectPerSceneLabel.fontColor = UIColor.black
        numIncorrectPerSceneLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        numIncorrectPerSceneLabel.preferredMaxLayoutWidth = 850
        numIncorrectPerSceneLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        numIncorrectPerSceneLabel.numberOfLines = 0
        numIncorrectPerSceneLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
        self.addChild(numIncorrectPerSceneLabel)

        // place label for accuracy per scene dictionary
        var accuracyDictionary = "7. Accuracy per scene: "
        accuracyDictionary.append("rock: \(Int(accuracyPerScene["rock"]!))%, ")
        accuracyDictionary.append("lamp: \(Int(accuracyPerScene["lamp"]!))%, ")
        accuracyDictionary.append("cat: \(Int(accuracyPerScene["cat"]!))%, ")
        accuracyDictionary.append("lion: \(Int(accuracyPerScene["lion"]!))%, ")
        accuracyDictionary.append("hand: \(Int(accuracyPerScene["hand"]!))%, ")
        accuracyDictionary.append("rain: \(Int(accuracyPerScene["rain"]!))%, ")
        accuracyDictionary.append("duck: \(Int(accuracyPerScene["duck"]!))%, ")
        accuracyDictionary.append("moon: \(Int(accuracyPerScene["moon"]!))%, ")
        accuracyDictionary.append("cow: \(Int(accuracyPerScene["cow"]!))%, ")
        accuracyDictionary.append("trash: \(Int(accuracyPerScene["trash"]!))%, ")
        accuracyDictionary.append("airplane: \(Int(accuracyPerScene["airplane"]!))%, ")
        accuracyDictionary.append("shoes: \(Int(accuracyPerScene["shoes"]!))%, ")
        accuracyDictionary.append("cake: \(Int(accuracyPerScene["cake"]!))%, ")
        accuracyDictionary.append("stroller: \(Int(accuracyPerScene["stroller"]!))%, ")
        accuracyDictionary.append("toast: \(Int(accuracyPerScene["toast"]!))%, ")
        accuracyDictionary.append("hat: \(Int(accuracyPerScene["hat"]!))%, ")
        accuracyDictionary.append("cookie: \(Int(accuracyPerScene["cookie"]!))%, ")
        accuracyDictionary.append("mouse: \(Int(accuracyPerScene["mouse"]!))% ")
        accuracyPerSceneLabel.text = accuracyDictionary
        accuracyPerSceneLabel.fontSize = 20
        accuracyPerSceneLabel.position = CGPoint(x: -457, y: -275)
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

