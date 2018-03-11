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

    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //PRINT LABELS FOR COMBO DICTIONARIES
        for (item, num) in comboCompletedDict {
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemSimple", correct: num, xCoord: 197.198, yCoord: 222.044)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemSimple", correct: num, xCoord: 197.198, yCoord: 150)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemSimple", correct: num, xCoord: 197.198, yCoord: 76.904)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemLine", correct: num, xCoord: 197.198, yCoord: 3)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemLine", correct: num, xCoord: 197.198, yCoord: -69.742)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemLine", correct: num,  xCoord: 197.198, yCoord: -141.09)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "twoItemScene", correct: num,  xCoord: 197.198, yCoord: -216.253)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "threeItemScene", correct: num,  xCoord: 197.198, yCoord: -286.45)
            checkOrX_completed_twoItems (scene: self, dictItem: item, category: "fourItemScene", correct: num,  xCoord: 197.198, yCoord: -362)
        }
        for (item, num) in comboNumFTDict {
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemSimple", firstTry: num, xCoord: -259.663, yCoord: 222.044)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemSimple", firstTry: num, xCoord: -259.663, yCoord: 150)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemSimple", firstTry: num, xCoord: -259.663, yCoord: 76.904)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemLine", firstTry: num, xCoord: -259.663, yCoord: 3)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemLine", firstTry: num, xCoord: -259.663, yCoord: -69.742)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemLine", firstTry: num,  xCoord: -259.663, yCoord: -141.09)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "twoItemScene", firstTry: num,  xCoord: -259.663, yCoord: -216.253)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "threeItemScene", firstTry: num,  xCoord: -259.663, yCoord: -286.45)
            checkOrX_firstTry_twoItems (scene: self, dictItem: item, category: "fourItemScene", firstTry: num,  xCoord: -259.663, yCoord: -362)
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for buttons
        let backButton = self.childNode(withName: "back")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if back button is touched
        if backButton!.contains(touch.location(in: self)) {
            resetAllGameStats_coloring()
            transitionScene (currentScene: self, sceneString: "ScoreScene3", waitTime: 0, fadeTime: 0)
        }
    }
}
