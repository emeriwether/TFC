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
    let nameLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
    let ageLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
    
    let totalCorrectFTLabel = SKLabelNode(fontNamed:"Montserrat-SemiBold")
    let setSize2Label = SKLabelNode(fontNamed: "Montserrat-Regular")
    let setSize3Label = SKLabelNode(fontNamed: "Montserrat-Regular")
    let setSize4Label = SKLabelNode(fontNamed: "Montserrat-Regular")
    let simpleBGLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let lineBGLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let sceneBGLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    
    let totalAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-SemiBold")
    let twoItemAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let threeItemAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let fourItemAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let simpleAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let lineAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let sceneAccuracyLabel = SKLabelNode(fontNamed: "Montserrat-Regular")

    let listCorrectFTLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
    let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")

    override func didMove(to view: SKView) {

    ////////////////////////////////////////////////////////////////////////////////////////////
        // CALCULATE ACCURACY FOR EACH SCENE
        for (item, _) in accuracyPerScene { calculateAccuracy(scene: item) }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE NAME & AGE LABELS
        printLabel (label: nameLabel, words: "\(userName)", xCoord: 164, yCoord: -469.413, fontSize: 28)
        printLabel (label: ageLabel, words: "\(userAge)", xCoord: 540, yCoord: -469.413, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE TOTAL-CORRECT-FT LABEL
        let totalCorrectFtText = "\(totalCorrectFT) / 18"
        printLabel(label: totalCorrectFTLabel, words: totalCorrectFtText, xCoord: 150, yCoord: 211, fontSize: 150)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE 2-ITEM-CORRECT-FT LABEL
        let setSize2String = "\(twoItemCorrectFT) / 6"
        printLabel(label: setSize2Label, words: setSize2String, xCoord: 136, yCoord: -14.482, fontSize: 28)
        
        // PLACE 3-ITEM-CORRECT-FT LABEL
        let setSize3String = "\(threeItemCorrectFT) / 6"
        printLabel(label: setSize3Label, words: setSize3String, xCoord: 136, yCoord: -48.659, fontSize: 28)
        
        // PLACE 4-ITEM-CORRECT-FT LABEL
        let setSize4String = "\(fourItemCorrectFT) / 6"
        printLabel(label: setSize4Label, words: setSize4String, xCoord: 136, yCoord: -83.483, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE SIMPLE-BG-CORRECT-FT LABEL
        let simpleBGString = "\(simpleCorrectFT)/6"
        printLabel(label: simpleBGLabel, words: simpleBGString, xCoord: 217, yCoord: -166.828, fontSize: 28)
        
        // PLACE LINE-BG-CORRECT-FT LABEL
        let lineBGString = "\(lineCorrectFT)/6"
        printLabel(label: lineBGLabel, words: lineBGString, xCoord: 217, yCoord: -200.828, fontSize: 28)

        // PLACE SCENE-BG-CORRECT-FT LABEL
        let sceneBGString = "\(sceneCorrectFT)/6"
        printLabel(label: sceneBGLabel, words: sceneBGString, xCoord: 217, yCoord: -235.829, fontSize: 28)
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
            totalAccuracyString = "\(Int(round(totalAccuracy)))%"
        } else {
            totalAccuracyString = "0%"
        }
        printLabel(label: totalAccuracyLabel, words: totalAccuracyString, xCoord: -475, yCoord: 211, fontSize: 150)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
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
            twoItemAccuracyText = "\(Int(round(twoItemAccuracy)))%"
        } else {
            twoItemAccuracyText = "none completed"
        }
        printLabel(label: twoItemAccuracyLabel, words: twoItemAccuracyText, xCoord: -490, yCoord: -14.482, fontSize: 28)

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
            threeItemAccuracyText = "\(Int(round(threeItemAccuracy)))%"
        } else {
            threeItemAccuracyText = "none completed"
        }
        printLabel(label: threeItemAccuracyLabel, words: threeItemAccuracyText, xCoord: -490, yCoord: -48.659, fontSize: 28)
        
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
            fourItemAccuracyText = "\(Int(round(fourItemAccuracy)))%"
        } else {
            fourItemAccuracyText = "none completed"
        }
        printLabel(label: fourItemAccuracyLabel, words: fourItemAccuracyText, xCoord: -490, yCoord: -83.483, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
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
            simpleAccuracyText = "\(Int(round(simpleAccuracy)))%"
        } else {
            simpleAccuracyText = "none completed"
        }
        printLabel(label: simpleAccuracyLabel, words: simpleAccuracyText, xCoord: -404, yCoord: -166.828, fontSize: 28)
        
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
            lineAccuracyText = "\(Int(round(lineAccuracy)))%"
        } else {
            lineAccuracyText = "none completed"
        }
        printLabel(label: lineAccuracyLabel, words: lineAccuracyText, xCoord: -404, yCoord: -200.828, fontSize: 28)
        
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
            sceneAccuracyText = "\(Int(round(sceneAccuracy)))%"
        } else {
            sceneAccuracyText = "none completed"
        }
        printLabel(label: sceneAccuracyLabel, words: sceneAccuracyText, xCoord: -404, yCoord: -235.829, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for buttons
        let viewSceneBreakdownButton = self.childNode(withName: "view scene breakdown")

        var playAgainButton = self.childNode(withName: "playagain")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // Functionality for viewSceneBreakdownButton
        
        let breakdownByItemsButton = SKSpriteNode(imageNamed: "ViewSceneBreakdownButtonPressed_items")
        breakdownByItemsButton.position = CGPoint(x: 3.883, y: -354.36)
        breakdownByItemsButton.zPosition = 3
        breakdownByItemsButton.size = CGSize(width: 1199.768, height: 68.719)
        breakdownByItemsButton.isHidden = true
        self.addChild(breakdownByItemsButton)
        
        let breakdownByBGButton = SKSpriteNode(imageNamed: "ViewSceneBreakdownButtonPressed_bg")
        breakdownByBGButton.position = CGPoint(x: 5.192, y: -412.37)
        breakdownByBGButton.zPosition = 3
        breakdownByBGButton.size = CGSize(width: 1202.768, height: 47.302)
        breakdownByBGButton.isHidden = true
        self.addChild(breakdownByBGButton)
        
        let breakdownByComboButton = SKSpriteNode(imageNamed: "ViewSceneBreakdownButtonPressed_combo")
        breakdownByComboButton.position = CGPoint(x: 3.478, y: -463.867)
        breakdownByComboButton.zPosition = 3
        breakdownByComboButton.size = CGSize(width: 1200.958, height: 55.692)
        breakdownByComboButton.isHidden = true
        self.addChild(breakdownByComboButton)
        
        if viewSceneBreakdownButton!.contains(touch.location(in:self)){
            playAgainButton!.removeFromParent()
            
            breakdownByItemsButton.isHidden = false
            breakdownByBGButton.isHidden = false
            breakdownByComboButton.isHidden = false
            
            if breakdownByItemsButton.contains(touch.location(in:self)) {
                transitionScene(currentScene: self, sceneString: "ScoreScene2", waitTime: 0)
            }
            
            if breakdownByBGButton.contains(touch.location(in:self)) {
                transitionScene(currentScene: self, sceneString: "ScoreScene3", waitTime: 0)
            }
            
            if breakdownByComboButton.contains(touch.location(in:self)) {
                transitionScene(currentScene: self, sceneString: "ScoreScene4", waitTime: 0)
            }

        }
        
        playAgainButton = self.childNode(withName: "playagain")
        
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
            transitionScene (currentScene: self, sceneString: "StartScene", waitTime: 1)
        }
    }
    
    func printLabel (label: SKLabelNode, words: String, xCoord: Double, yCoord: Double, fontSize: CGFloat) {
        label.text = words
        label.fontSize = fontSize
        label.position = CGPoint(x: xCoord, y: yCoord)
        label.zPosition = 10
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        label.fontColor = UIColor.black
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        self.addChild(label)
    }
    
    func printListLabel (label: SKLabelNode, words: String, xCoord: Double, yCoord: Double, fontSize: Int) {
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


