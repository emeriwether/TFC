//
//  ScoreScene4.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class ScoreScene4: SKScene {
    
    override func didMove(to view: SKView) {
    
    ////////////////////////////////////////////////////////////////////////////////////////////
        let nameLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        let ageLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        
        // PLACE NAME & AGE LABELS
        printLabel (scene: self, label: nameLabel, words: "\(userName)", xCoord: -45.499, yCoord: -490.891, fontSize: 28)
        printLabel (scene: self, label: ageLabel, words: "\(userAge)", xCoord: 312, yCoord: 491, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE COMBO DICTIONARIES
        for (scene, num) in numCorrectPerScene {
            if scene == "rock" { comboCompletedDict["twoItemSimple"] = comboCompletedDict["twoItemSimple"]! + num }
            if scene == "lamp" { comboCompletedDict["twoItemSimple"] = comboCompletedDict["twoItemSimple"]! + num }
            if scene == "cat" { comboCompletedDict["threeItemSimple"] = comboCompletedDict["threeItemSimple"]! + num }
            if scene == "lion" { comboCompletedDict["threeItemSimple"] = comboCompletedDict["threeItemSimple"]! + num }
            if scene == "hand" { comboCompletedDict["fourItemSimple"] = comboCompletedDict["fourItemSimple"]! + num }
            if scene == "rain" { comboCompletedDict["fourItemSimple"] = comboCompletedDict["fourItemSimple"]! + num }
            if scene == "duck" { comboCompletedDict["twoItemLine"] = comboCompletedDict["twoItemLine"]! + num }
            if scene == "moon" { comboCompletedDict["twoItemLine"] = comboCompletedDict["twoItemLine"]! + num }
            if scene == "cow" { comboCompletedDict["threeItemLine"] = comboCompletedDict["threeItemLine"]! + num }
            if scene == "trash" { comboCompletedDict["threeItemLine"] = comboCompletedDict["threeItemLine"]! + num }
            if scene == "airplane" { comboCompletedDict["fourItemLine"] = comboCompletedDict["fourItemLine"]! + num }
            if scene == "shoes" { comboCompletedDict["fourItemLine"] = comboCompletedDict["fourItemLine"]! + num }
            if scene == "cake" { comboCompletedDict["twoItemScene"] = comboCompletedDict["twoItemScene"]! + num }
            if scene == "stroller" { comboCompletedDict["twoItemScene"] = comboCompletedDict["twoItemScene"]! + num }
            if scene == "toast" { comboCompletedDict["threeItemScene"] = comboCompletedDict["threeItemScene"]! + num }
            if scene == "hat" { comboCompletedDict["threeItemScene"] = comboCompletedDict["threeItemScene"]! + num }
            if scene == "cookie" { comboCompletedDict["fourItemScene"] = comboCompletedDict["fourItemScene"]! + num }
            if scene == "mouse" { comboCompletedDict["fourItemScene"] = comboCompletedDict["fourItemScene"]! + num }
        }
        
        for (scene, num) in numIncorrectPerScene {
            print("scene: \(scene), num: \(num)")

            if scene == "rock" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemSimple"]! + num }
            if scene == "lamp" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemSimple"]! + num }
            if scene == "cat" { comboNumIncorrectDict["threeItemSimple"] = comboNumIncorrectDict["threeItemSimple"]! + num }
            if scene == "lion" { comboNumIncorrectDict["threeItemSimple"] = comboNumIncorrectDict["threeItemSimple"]! + num }
            if scene == "hand" { comboNumIncorrectDict["fourItemSimple"] = comboNumIncorrectDict["fourItemSimple"]! + num }
            if scene == "rain" { comboNumIncorrectDict["fourItemSimple"] = comboNumIncorrectDict["fourItemSimple"]! + num }
            if scene == "duck" { comboNumIncorrectDict["twoItemLine"] = comboNumIncorrectDict["twoItemLine"]! + num }
            if scene == "moon" { comboNumIncorrectDict["twoItemLine"] = comboNumIncorrectDict["twoItemLine"]! + num }
            if scene == "cow" { comboNumIncorrectDict["threeItemLine"] = comboNumIncorrectDict["threeItemLine"]! + num }
            if scene == "trash" { comboNumIncorrectDict["threeItemLine"] = comboNumIncorrectDict["threeItemLine"]! + num }
            if scene == "airplane" { comboNumIncorrectDict["fourItemLine"] = comboNumIncorrectDict["fourItemLine"]! + num }
            if scene == "shoes" { comboNumIncorrectDict["fourItemLine"] = comboNumIncorrectDict["fourItemLine"]! + num }
            if scene == "cake" { comboNumIncorrectDict["twoItemScene"] = comboNumIncorrectDict["twoItemScene"]! + num }
            if scene == "stroller" { comboNumIncorrectDict["twoItemScene"] = comboNumIncorrectDict["twoItemScene"]! + num }
            if scene == "toast" { comboNumIncorrectDict["threeItemScene"] = comboNumIncorrectDict["threeItemScene"]! + num }
            if scene == "hat" { comboNumIncorrectDict["threeItemScene"] = comboNumIncorrectDict["threeItemScene"]! + num }
            if scene == "cookie" { comboNumIncorrectDict["fourItemScene"] = comboNumIncorrectDict["fourItemScene"]! + num }
            if scene == "mouse" { comboNumIncorrectDict["fourItemScene"] = comboNumIncorrectDict["fourItemScene"]! + num }
        }
        
        for (scene, firstTry) in correctFirstTries {
            if scene == "rock" {
                if firstTry == true { comboNumFTDict["twoItemSimple"] = comboNumFTDict["twoItemSimple"]! + 1} }
            if scene == "lamp" {
                if firstTry == true { comboNumFTDict["twoItemSimple"] = comboNumFTDict["twoItemSimple"]! + 1} }
            if scene == "cat" {
                if firstTry == true { comboNumFTDict["threeItemSimple"] = comboNumFTDict["threeItemSimple"]! + 1} }
            if scene == "lion" {
                if firstTry == true { comboNumFTDict["threeItemSimple"] = comboNumFTDict["threeItemSimple"]! + 1} }
            if scene == "hand" {
                if firstTry == true { comboNumFTDict["fourItemSimple"] = comboNumFTDict["fourItemSimple"]! + 1} }
            if scene == "rain" {
                if firstTry == true { comboNumFTDict["fourItemSimple"] = comboNumFTDict["fourItemSimple"]! + 1} }
            if scene == "duck" {
                if firstTry == true { comboNumFTDict["twoItemLine"] = comboNumFTDict["twoItemLine"]! + 1} }
            if scene == "moon" {
                if firstTry == true { comboNumFTDict["twoItemLine"] = comboNumFTDict["twoItemLine"]! + 1} }
            if scene == "cow" {
                if firstTry == true { comboNumFTDict["threeItemLine"] = comboNumFTDict["threeItemLine"]! + 1} }
            if scene == "trash" {
                if firstTry == true { comboNumFTDict["threeItemLine"] = comboNumFTDict["threeItemLine"]! + 1} }
            if scene == "airplane" {
                if firstTry == true { comboNumFTDict["fourItemLine"] = comboNumFTDict["fourItemLine"]! + 1} }
            if scene == "shoes" {
                if firstTry == true { comboNumFTDict["fourItemLine"] = comboNumFTDict["fourItemLine"]! + 1} }
            if scene == "cake" {
                if firstTry == true { comboNumFTDict["twoItemScene"] = comboNumFTDict["twoItemScene"]! + 1} }
            if scene == "stroller" {
                if firstTry == true { comboNumFTDict["twoItemScene"] = comboNumFTDict["twoItemScene"]! + 1} }
            if scene == "toast" {
                if firstTry == true { comboNumFTDict["threeItemScene"] = comboNumFTDict["threeItemScene"]! + 1} }
            if scene == "hat" {
                if firstTry == true { comboNumFTDict["threeItemScene"] = comboNumFTDict["threeItemScene"]! + 1} }
            if scene == "cookie" {
                if firstTry == true { comboNumFTDict["fourItemScene"] = comboNumFTDict["fourItemScene"]! + 1} }
            if scene == "mouse" {
                if firstTry == true { comboNumFTDict["fourItemScene"] = comboNumFTDict["fourItemScene"]! + 1} }
            
        }

    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //PRINT LABELS FOR COMBO DICTIONARIES
        for (item, numCompleted) in comboCompletedDict {
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: 232.044)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: 160)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: 86.904)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemLine", correct: numCompleted, xCoord: -259.663, yCoord: 13)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemLine", correct: numCompleted, xCoord: -259.663, yCoord: -59.742)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemLine", correct: numCompleted, xCoord: -259.663, yCoord: -131.09)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemScene", correct: numCompleted, xCoord: -259.663, yCoord: -206.253)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemScene", correct: numCompleted, xCoord: -259.663, yCoord: -276.45)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemScene", correct: numCompleted, xCoord: -259.663, yCoord: -352)
        }
        
        for (item, numIncorrect) in numIncorrectPerScene {
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: 232.044)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: 160)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: 86.904)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: 13)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: -59.742)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: -131.09)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: -206.253)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: -276.45)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: -352)

        }
        
        for (item, num) in comboNumFTDict {
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemSimple", firstTry: num, xCoord: 197.198, yCoord: 232.044)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemSimple", firstTry: num, xCoord: 197.198, yCoord: 150)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemSimple", firstTry: num, xCoord: 197.198, yCoord: 76.904)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemLine", firstTry: num, xCoord: 197.198, yCoord: 3)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemLine", firstTry: num, xCoord: 197.198, yCoord: -69.742)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemLine", firstTry: num,  xCoord: 197.198, yCoord: -141.09)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemScene", firstTry: num,  xCoord: 197.198, yCoord: -216.253)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemScene", firstTry: num,  xCoord: 197.198, yCoord: -286.45)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemScene", firstTry: num,  xCoord: 197.198, yCoord: -362)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for buttons
        let backButton = self.childNode(withName: "back")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if back button is touched
        if backButton!.contains(touch.location(in: self)) {
            transitionScene (currentScene: self, sceneString: "ScoreScene3", waitTime: 0, fadeTime: 0)
        }
    }
}
