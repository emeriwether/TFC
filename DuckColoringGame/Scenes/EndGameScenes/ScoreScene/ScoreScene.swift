//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
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
    // LOCAL VARIABLES FOR LABELS
    let nameLabel = SKLabelNode(fontNamed:"Calibri")
    let ageLabel = SKLabelNode(fontNamed:"Calibri")
    
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

    let listCorrectFTLabel = SKLabelNode(fontNamed:"Calibri")
    let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Calibri")
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Calibri")

    override func didMove(to view: SKView) {
        
        // CALCULATE ACCURACY FOR EACH SCENE
        for (item, _) in accuracyPerScene { calculateAccuracy(scene: item) }
        
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE NAME & AGE LABELS
        printLabel (label: nameLabel, words: nameInput, xCoord: -550, yCoord: 485)
        printLabel (label: ageLabel, words: nameInput, xCoord: -550, yCoord: 445)
    ////////////////////////////////////////////////////////////////////////////////////////////

        
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE TOTAL-CORRECT-FT LABEL
        let totalCorrectFtText = "1. Number of scenes with correct first time: \(totalCorrectFT) / 18"
        printLabel(label: totalCorrectFTLabel, words: totalCorrectFtText, xCoord: -550, yCoord: 425)
    ////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE CORRECT-FT-BY-ITEM-COUNT LABEL
        printLabel(label: totalCorrectBySetSizeLabel, words: "2. Scenes with correct first time, by item count", xCoord: -550, yCoord: 385)
        
        // PLACE 2-ITEM-CORRECT-FT LABEL
        let setSize2String = "2: \(twoItemCorrectFT) / 6"
        printLabel(label: setSize2Label, words: setSize2String, xCoord: -500, yCoord: 355)
        
        // PLACE 3-ITEM-CORRECT-FT LABEL
        let setSize3String = "3: \(threeItemCorrectFT) / 6"
        printLabel(label: setSize3Label, words: setSize3String, xCoord: -500, yCoord: 335)
        
        // PLACE 4-ITEM-CORRECT-FT LABEL
        let setSize4String = "4: \(fourItemCorrectFT) / 6"
        printLabel(label: setSize4Label, words: setSize4String, xCoord: -500, yCoord: 315)
    ////////////////////////////////////////////////////////////////////////////////////////////
    
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE CORRECT-FT-BY-BG-TYPE LABEL
        printLabel(label: totalCorrectByBgTypeLabel, words: "3. Scenes with correct first time, by background type", xCoord: -550, yCoord: 275)

        // PLACE SIMPLE-BG-CORRECT-FT LABEL
        let simpleBGString = "Simple: \(simpleCorrectFT)/6"
        printLabel(label: simpleBGLabel, words: simpleBGString, xCoord: -500, yCoord: 255)
        
        // PLACE LINE-BG-CORRECT-FT LABEL
        let lineBGString = "Line:      \(lineCorrectFT)/6"
        printLabel(label: lineBGLabel, words: lineBGString, xCoord: -500, yCoord: 235)

        // PLACE SCENE-BG-CORRECT-FT LABEL
        let sceneBGString = "Scene:  \(sceneCorrectFT)/6"
        printLabel(label: sceneBGLabel, words: sceneBGString, xCoord: -500, yCoord: 215)
    ////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////////////
        // CALCULATE AND PLACE AVERAGE-ACCURACY LABEL
        for (scene, accuracy) in accuracyPerScene {
            if (accuracyPerScene[scene]! > 0) {
                totalAccuracy += accuracy
                numOfScenesCompleted += 1
            }
        }
        totalAccuracy = totalAccuracy / numOfScenesCompleted
        var totalAccuracyString:String
        if (totalAccuracy > 0.0 ) {
            totalAccuracyString = "4. Average accuracy: \(Int(round(totalAccuracy)))%"
        } else {
            totalAccuracyString = "4. Average accuracy: 0%"
        }
        printLabel(label: totalAccuracyLabel, words: totalAccuracyString, xCoord: -550, yCoord: 165)
    ////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLASE ACCURACY-BY-ITEM-COUNT LABEL
        printLabel(label: accuracyByItemCountLabel, words: "5. Accuracy by item count", xCoord: -550, yCoord: 115)

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
            twoItemAccuracyText = "2: \(Int(round(twoItemAccuracy)))%"
        } else {
            twoItemAccuracyText = "2: none completed"
        }
        printLabel(label: twoItemAccuracyLabel, words: twoItemAccuracyText, xCoord: -500, yCoord: 95)

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
            threeItemAccuracyText = "3: \(Int(round(threeItemAccuracy)))%"
        } else {
            threeItemAccuracyText = "3: none completed"
        }
        printLabel(label: threeItemAccuracyLabel, words: threeItemAccuracyText, xCoord: -500, yCoord: 75)
        
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
            fourItemAccuracyText = "4: \(Int(round(fourItemAccuracy)))%"
        } else {
            fourItemAccuracyText = "4: none completed"
        }
        printLabel(label: fourItemAccuracyLabel, words: fourItemAccuracyText, xCoord: -500, yCoord: 55)
    ////////////////////////////////////////////////////////////////////////////////////////////
        
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLASE ACCURACY-BY-BG-TYPE LABEL
        printLabel(label: accuracyByBgTypeLabel, words: "6. Accuracy by bg type", xCoord: -550, yCoord: 5)
        
        // CALCULATE AND PLACE SIMPLE-BG ACCURACY LABEL
        let simpleBgArray: [String] = ["rock", "lamp", "cat", "shoes", "lion", "hand"]
        for item in simpleBgArray {
            if accuracyPerScene[item]! > 0.0 {
                simpleAccuracy += accuracyPerScene[item]!
                simplebgCompleted += 1
            }
        }
        simpleAccuracy = simpleAccuracy / simplebgCompleted
        var simpleAccuracyText:String
        if simplebgCompleted > 0 {
            simpleAccuracyText = "Simple: \(Int(round(simpleAccuracy)))%"
        } else {
            simpleAccuracyText = "Simple: none completed"
        }
        printLabel(label: simpleAccuracyLabel, words: simpleAccuracyText, xCoord: -500, yCoord: -15)
        
        // CALCULATE AND PLACE LINE-BG ACCURACY LABEL
        let lineBgArray: [String] = ["duck", "moon", "cow", "trash", "airplane", "shoes"]
        for item in lineBgArray {
            if accuracyPerScene[item]! > 0.0 {
                lineAccuracy += accuracyPerScene[item]!
                linebgCompleted += 1
            }
        }
        lineAccuracy = lineAccuracy / linebgCompleted
        var lineAccuracyText:String
        if linebgCompleted > 0 {
            lineAccuracyText = "Line:     \(Int(round(lineAccuracy)))%"
        } else {
            lineAccuracyText = "Line:     none completed"
        }
        printLabel(label: lineAccuracyLabel, words: lineAccuracyText, xCoord: -500, yCoord: -35)
        
        // CALCULATE AND PLACE LINE-BG ACCURACY LABEL
        let sceneBgArray: [String] = ["cake", "stroller", "toast", "hat", "cookie", "mouse"]
        for item in sceneBgArray {
            if accuracyPerScene[item]! > 0.0 {
                sceneAccuracy += accuracyPerScene[item]!
                scenebgCompleted += 1
            }
        }
        sceneAccuracy = sceneAccuracy / scenebgCompleted
        var sceneAccuracyText:String
        if linebgCompleted > 0 {
            sceneAccuracyText = "Scene:  \(Int(round(sceneAccuracy)))%"
        } else {
            sceneAccuracyText = "Scene:  none completed"
        }
        printLabel(label: sceneAccuracyLabel, words: sceneAccuracyText, xCoord: -500, yCoord: -55)
    ////////////////////////////////////////////////////////////////////////////////////////////
        
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE LIST OF SCENES WITH CORRECT-FT LABEL
        let correctFTjoined = correctFirstTriesArray.joined(separator: ", ")
        var correctFTArrayText: String
        if correctFirstTriesArray.count > 0 {
            correctFTArrayText = "7. Scenes w/ correct first time: \(correctFTjoined)"
        }
        else {
            correctFTArrayText = "7. Scenes w/ correct first time: none"
        }
        printListLabel (label: listCorrectFTLabel, words: correctFTArrayText, xCoord: -550, yCoord: -95)
    ////////////////////////////////////////////////////////////////////////////////////////////

    ////////////////////////////////////////////////////////////////////////////////////////////
        // CREATE & PRINT LABELS FOR DICTIONARIES OF CORRECT & INCORRECT TOUCHES & ACCURACY PER SCENE
        var correctDictionary = "8. # of correct touches per scene: "
        var incorrectDictionary = "9. # of incorrect touches per scene: "
        var accuracyDictionary = "10. Accuracy per scene: "
        
        for (item, _) in accuracyPerScene {
            if item != "mouse" {
                correctDictionary.append("\(item): \(numCorrectPerScene[item]!), ")
                incorrectDictionary.append("\(item): \(numIncorrectPerScene[item]!), ")
                accuracyDictionary.append("\(item): \(Int(round(accuracyPerScene[item]!)))%, ")
            }
            else {
                correctDictionary.append("\(item): \(numCorrectPerScene[item]!)")
                incorrectDictionary.append("\(item): \(numIncorrectPerScene[item]!)")
                accuracyDictionary.append("\(item): \(Int(round(accuracyPerScene[item]!)))%")
            }
        }
        
        printListLabel (label: numCorrectPerSceneLabel, words: correctDictionary, xCoord: -550, yCoord: -145)
        printListLabel (label: numIncorrectPerSceneLabel, words: incorrectDictionary, xCoord: -550, yCoord: -220)
        printListLabel (label: accuracyPerSceneLabel, words: accuracyDictionary, xCoord: -550, yCoord: -295)
    ////////////////////////////////////////////////////////////////////////////////////////////
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
    
    func printListLabel (label: SKLabelNode, words: String, xCoord: Double, yCoord: Double) {
        label.text = words
        label.fontSize = 20
        label.position = CGPoint(x: xCoord, y: yCoord)
        label.zPosition = 10
        label.fontColor = UIColor.black
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        label.preferredMaxLayoutWidth = 1000
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
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

