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
        printLabel (scene: self, label: ageLabel, words: "\(userAge)", xCoord: 320, yCoord: -490, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE ACCURACY COMBO DICTIONARY
        comboAccuracyDict["twoItemSimple"] = (Double(comboCompletedDict["twoItemSimple"]!) / (Double(comboCompletedDict["twoItemSimple"]!) + Double(comboNumIncorrectDict["twoItemSimple"]!)) * 100)
        comboAccuracyDict["threeItemSimple"] = (Double(comboCompletedDict["threeItemSimple"]!) / (Double(comboCompletedDict["threeItemSimple"]!) + Double(comboNumIncorrectDict["threeItemSimple"]!)) * 100)
        comboAccuracyDict["fourItemSimple"] = (Double(comboCompletedDict["fourItemSimple"]!) / (Double(comboCompletedDict["fourItemSimple"]!) + Double(comboNumIncorrectDict["fourItemSimple"]!)) * 100)
        
        comboAccuracyDict["twoItemLine"] = (Double(comboCompletedDict["twoItemLine"]!) / (Double(comboCompletedDict["twoItemLine"]!) + Double(comboNumIncorrectDict["twoItemLine"]!)) * 100)
        comboAccuracyDict["threeItemLine"] = (Double(comboCompletedDict["threeItemLine"]!) / (Double(comboCompletedDict["threeItemLine"]!) + Double(comboNumIncorrectDict["threeItemLine"]!)) * 100)
        comboAccuracyDict["fourItemLine"] = (Double(comboCompletedDict["fourItemLine"]!) / (Double(comboCompletedDict["fourItemLine"]!) + Double(comboNumIncorrectDict["fourItemLine"]!)) * 100)
        
        comboAccuracyDict["twoItemScene"] = (Double(comboCompletedDict["twoItemScene"]!) / (Double(comboCompletedDict["twoItemScene"]!) + Double(comboNumIncorrectDict["twoItemScene"]!)) * 100)
        comboAccuracyDict["threeItemScene"] = (Double(comboCompletedDict["threeItemScene"]!) / (Double(comboCompletedDict["threeItemScene"]!) + Double(comboNumIncorrectDict["threeItemScene"]!)) * 100)
        comboAccuracyDict["fourItemScene"] = (Double(comboCompletedDict["fourItemScene"]!) / (Double(comboCompletedDict["fourItemScene"]!) + Double(comboNumIncorrectDict["fourItemScene"]!)) * 100)

        
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //PRINT LABELS FOR COMBO DICTIONARIES
        for (item, numCompleted) in comboCompletedDict {
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: 236)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemLine", correct: numCompleted, xCoord: -259.663, yCoord: 164)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemScene", correct: numCompleted, xCoord: -259.663, yCoord: 90)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: 17)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemLine", correct: numCompleted, xCoord: -259.663, yCoord: -55)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemScene", correct: numCompleted, xCoord: -259.663, yCoord: -127)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemSimple", correct: numCompleted, xCoord: -259.663, yCoord: -202)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemLine", correct: numCompleted, xCoord: -259.663, yCoord: -272)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemScene", correct: numCompleted, xCoord: -259.663, yCoord: -348)
        }
        
        for (item, numIncorrect) in comboNumIncorrectDict {
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: 228)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: 156)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "twoItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: 82)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: 9)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: -63)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "threeItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: -135)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemSimple", numIncorrect: numIncorrect, xCoord: 0, yCoord: -210)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemLine", numIncorrect: numIncorrect, xCoord: 0, yCoord: -280)
            incorrectTouchesLabels_twoItems (scene: self, dictItem: item, category: "fourItemScene", numIncorrect: numIncorrect, xCoord: 0, yCoord: -356)

        }
        
        for (item, num) in comboNumFTDict {
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemSimple", firstTry: num, xCoord: 197.198, yCoord: 236)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemLine", firstTry: num, xCoord: 197.198, yCoord: 164)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemScene", firstTry: num,  xCoord: 197.198, yCoord: 90)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemSimple", firstTry: num, xCoord: 197.198, yCoord: 17)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemLine", firstTry: num, xCoord: 197.198, yCoord: -55)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemScene", firstTry: num,  xCoord: 197.198, yCoord: -127)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemSimple", firstTry: num, xCoord: 197.198, yCoord: -202)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemLine", firstTry: num,  xCoord: 197.198, yCoord: -272)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemScene", firstTry: num,  xCoord: 197.198, yCoord: -348)
        }
        
        for (item, num) in comboAccuracyDict {
            accuracyLabels (scene: self, sceneString: item, word: "twoItemSimple", accuracy: num, xCoord: 474, yCoord: 228)
            accuracyLabels (scene: self, sceneString: item, word: "twoItemLine", accuracy: num, xCoord: 474, yCoord: 156)
            accuracyLabels (scene: self, sceneString: item, word: "twoItemScene", accuracy: num, xCoord: 474, yCoord: 82)
            accuracyLabels (scene: self, sceneString: item, word: "threeItemSimple", accuracy: num, xCoord: 474, yCoord: 9)
            accuracyLabels (scene: self, sceneString: item, word: "threeItemLine", accuracy: num, xCoord: 474, yCoord: -63)
            accuracyLabels (scene: self, sceneString: item, word: "threeItemScene", accuracy: num, xCoord: 474, yCoord: -135)
            accuracyLabels (scene: self, sceneString: item, word: "fourItemSimple", accuracy: num, xCoord: 474, yCoord: -210)
            accuracyLabels (scene: self, sceneString: item, word: "fourItemLine", accuracy: num, xCoord: 474, yCoord: -280)
            accuracyLabels (scene: self, sceneString: item, word: "fourItemScene", accuracy: num, xCoord: 474, yCoord: -356)
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
