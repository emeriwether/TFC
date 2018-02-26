//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

//PUBLIC VARIABLES TO KEEP TRACK OF STATISTICS//
// scenes completed
var numOfScenesCompleted = 0.0
var twoItemCompleted = 0.0
var threeItemCompleted = 0.0
var fourItemCompleted = 0.0
var simplebgCompleted = 0.0
var linebgCompleted = 0.0
var scenebgCompleted = 0.0

///// Totals ///////////
var totalCorrectFT = 0
var twoItemCorrectFT = 0
var threeItemCorrectFT = 0
var fourItemCorrectFT = 0
var simpleCorrectFT = 0
var lineCorrectFT = 0
var sceneCorrectFT = 0

var totalAccuracy = 0.0
var twoItemAccuracy = 0.0
var threeItemAccuracy = 0.0
var fourItemAccuracy = 0.0
var simpleAccuracy = 0.0
var lineAccuracy = 0.0
var sceneAccuracy = 0.0

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
    let accuracyByItemCountLabel = SKLabelNode(fontNamed: "Calibri")
    let twoItemAccuracyLabel = SKLabelNode(fontNamed: "Calibri")
    let threeItemAccuracyLabel = SKLabelNode(fontNamed: "Calibri")
    let fourItemAccuracyLabel = SKLabelNode(fontNamed: "Calibri")
    let accuracyByBgTypeLabel = SKLabelNode(fontNamed: "Calibri")
    let simpleAccuracyLabel = SKLabelNode(fontNamed: "Calibri")
    let lineAccuracyLabel = SKLabelNode(fontNamed: "Calibri")
    let sceneAccuracyLabel = SKLabelNode(fontNamed: "Calibri")

    ////// Scene Breakdowns ////////////////
    let listCorrectFTLabel = SKLabelNode(fontNamed:"Calibri")
    let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Calibri")

    override func didMove(to view: SKView) {
        
        for (item, _) in accuracyPerScene {
            calculateAccuracy(scene: item)
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
        let setSize2String = "2: \(twoItemCorrectFT) / 6"
        printLabel(label: setSize2Label, words: setSize2String, xCoord: -410, yCoord: 345)
        
        // place correct score in set size 3 on screen
        let setSize3String = "3: \(threeItemCorrectFT) / 6"
        printLabel(label: setSize3Label, words: setSize3String, xCoord: -410, yCoord: 315)
        
        // place correct score in set size 4 on screen
        let setSize4String = "4: \(fourItemCorrectFT) / 6"
        printLabel(label: setSize4Label, words: setSize4String, xCoord: -410, yCoord: 285)

        // place totalCorrectByBG label
        printLabel(label: totalCorrectByBgTypeLabel, words: "3. Scenes with correct first time, by background type", xCoord: -457, yCoord: 235)

        // place correct score in simple bg type
        let simpleBGString = "Simple: \(simpleCorrectFT)/6"
        printLabel(label: simpleBGLabel, words: simpleBGString, xCoord: -410, yCoord: 205)
        
        // place correct score in line bg type
        let lineBGString = "Line:      \(lineCorrectFT)/6"
        printLabel(label: lineBGLabel, words: lineBGString, xCoord: -410, yCoord: 175)

        // place correct score in scene bg type
        let sceneBGString = "Scene:   \(sceneCorrectFT)/6"
        printLabel(label: sceneBGLabel, words: sceneBGString, xCoord: -410, yCoord: 145)

        // CALCULATE AND PLACE AVERAGE-ACCURACY LABEL
        for (scene, accuracy) in accuracyPerScene {
            if (accuracyPerScene[scene]! > 0) {
                totalAccuracy += accuracy
                numOfScenesCompleted += 1
            }
        }
        totalAccuracy = totalAccuracy / numOfScenesCompleted
        let totalAccuracyString = "4. Average accuracy: \(Int(round(totalAccuracy)))%"
        printLabel(label: totalAccuracyLabel, words: totalAccuracyString, xCoord: -457, yCoord: 95)
        
        // PLASE ACCURACY-BY-ITEM LABEL
        printLabel(label: accuracyByItemCountLabel, words: "5. Accuracy by item count", xCoord: -457, yCoord: 45)

        // CALCULATE AND PLACE 2-ITEM ACCURACY LABEL
        let twoItemArray: [String] = ["rock", "lamp", "duck", "moon", "cake", "stroller"]
        for item in twoItemArray {
            if accuracyPerScene[item]! > 0.0 {
                twoItemAccuracy += accuracyPerScene[item]!
                twoItemCompleted += 1
            }
        }
        twoItemAccuracy = twoItemAccuracy / twoItemCompleted
        var twoItemAccuracyText:String
        if twoItemCompleted > 0 {
            twoItemAccuracyText = "2 items: \(Int(round(twoItemAccuracy)))%"
        } else {
            twoItemAccuracyText = "2 items: none completed"
        }
        printLabel(label: twoItemAccuracyLabel, words: twoItemAccuracyText, xCoord: -410, yCoord: 15)

        // CALCULATE AND PLACE 3-ITEM ACCURACY LABEL
        let threeItemArray: [String] = ["cat", "lion", "cow", "trash", "toast", "hat"]
        for item in threeItemArray {
            if accuracyPerScene[item]! > 0.0 {
                threeItemAccuracy += accuracyPerScene[item]!
                threeItemCompleted += 1
            }
        }
        threeItemAccuracy = threeItemAccuracy / threeItemCompleted
        var threeItemAccuracyText:String
        if threeItemCompleted > 0 {
            threeItemAccuracyText = "3 items: \(Int(round(threeItemAccuracy)))%"
        } else {
            threeItemAccuracyText = "3 items: none completed"
        }
        printLabel(label: threeItemAccuracyLabel, words: threeItemAccuracyText, xCoord: -410, yCoord: -15)

        
        // CALCULATE AND PLACE 4-ITEM ACCURACY LABEL
        let fourItemArray: [String] = ["hand", "rain", "airplane", "shoes", "cookie", "mouse"]
        for item in fourItemArray {
            if accuracyPerScene[item]! > 0.0 {
                fourItemAccuracy += accuracyPerScene[item]!
                fourItemCompleted += 1
            }
        }
        fourItemAccuracy = fourItemAccuracy / fourItemCompleted
        var fourItemAccuracyText:String
        if fourItemCompleted > 0 {
            fourItemAccuracyText = "4 items: \(Int(round(fourItemAccuracy)))%"
        } else {
            fourItemAccuracyText = "4 items: none completed"
        }
        printLabel(label: fourItemAccuracyLabel, words: fourItemAccuracyText, xCoord: -410, yCoord: -35)

        
        // place accuracy by background type label
        
        // place simple bg accuracy label
        
        // place line bg accuracy level
        
        // place scene bg accuracy level
        
        // place list of scenes with correct first time
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        if correctFirstTriesArray.count > 0 {
            listCorrectFTLabel.text = "7. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            listCorrectFTLabel.text = "7. Scenes w/ correct first time: none"
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
        var correctDictionary = "8. # of correct touches per scene: "
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
        var incorrectDictionary = "9. # of incorrect touches per scene: "
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
            numOfScenesCompleted = 0.0
            twoItemCompleted = 0.0
            threeItemCompleted = 0.0
            fourItemCompleted = 0.0
            simplebgCompleted = 0.0
            linebgCompleted = 0.0
            scenebgCompleted = 0.0
            
            totalCorrectFT = 0
            twoItemCorrectFT = 0
            threeItemCorrectFT = 0
            fourItemCorrectFT = 0
            simpleCorrectFT = 0
            lineCorrectFT = 0
            sceneCorrectFT = 0
            
            totalAccuracy = 0.0
            twoItemAccuracy = 0.0
            threeItemAccuracy = 0.0
            fourItemAccuracy = 0.0
            simpleAccuracy = 0.0
            lineAccuracy = 0.0
            sceneAccuracy = 0.0
            
            correctFirstTriesArray.removeAll()
            for (scene, _) in numCorrectPerScene {
                numCorrectPerScene[scene] = 0
            }
            for (scene, _) in numIncorrectPerScene {
                numIncorrectPerScene[scene] = 0
            }
            for (scene, _) in accuracyPerScene {
                accuracyPerScene[scene] = 0
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
    
    func printLabel (label: SKLabelNode, words: String, xCoord: Double, yCoord: Double) {
        label.text = words
        label.fontSize = 20
        label.position = CGPoint(x: xCoord, y: yCoord)
        label.zPosition = 10
        label.fontColor = UIColor.black
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(label)
    }
    
    func calculateAccuracy (scene: String) {
        if (numCorrectPerScene[scene]! == 0) { accuracyPerScene[scene] = 0 }
        else if (numIncorrectPerScene[scene]! == 0) {accuracyPerScene[scene] = 100 }
        else {
            accuracyPerScene[scene] = round((Double(numCorrectPerScene[scene]!) / Double(numIncorrectPerScene[scene]! + numCorrectPerScene[scene]!)) * 100)
        }
    }
    
}

