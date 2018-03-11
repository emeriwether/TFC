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
        for (scene, num) in numIncorrectPerScene {
            if scene == "rock" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemSimple"]! + num }
            if scene == "lamp" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemSimple"]! + num }
            if scene == "cat" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemSimple"]! + num }
            if scene == "lion" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemSimple"]! + num }
            if scene == "hand" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemSimple"]! + num }
            if scene == "rain" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemSimple"]! + num }
            if scene == "duck" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemLine"]! + num }
            if scene == "moon" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemLine"]! + num }
            if scene == "cow" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemLine"]! + num }
            if scene == "trash" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemLine"]! + num }
            if scene == "airplane" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemLine"]! + num }
            if scene == "shoes" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemLine"]! + num }
            if scene == "cake" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemScene"]! + num }
            if scene == "stroller" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["twoItemScene"]! + num }
            if scene == "toast" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemScene"]! + num }
            if scene == "hat" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["threeItemScene"]! + num }
            if scene == "cookie" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemScene"]! + num }
            if scene == "mouse" { comboNumIncorrectDict["twoItemSimple"] = comboNumIncorrectDict["fourItemScene"]! + num }
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
