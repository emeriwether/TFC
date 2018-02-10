//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class AllDoneScene: SKScene {
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variables for retry & stats buttons
        let playAgainButton = self.childNode(withName: "play again button")
        let viewStatsButton = self.childNode(withName: "view stats button")

        // variable to keep track of touch
        let touch = touches.first!
        
        // if stats button is touched
        if viewStatsButton!.contains(touch.location(in: self)) {
            let passwordScene = SKScene(fileNamed: "PasswordScene")
            passwordScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(passwordScene!, transition: fade)
        }
        
        // if retry button is touched
        if playAgainButton!.contains(touch.location(in: self)) {
            
            // reset all game-wide stats
            numOfCorrectSetSize2 = 0
            numOfCorrectSetSize3 = 0
            numOfCorrectSetSize4 = 0
            numOfCorrectSimpleBG = 0
            numOfCorrectLineBG = 0
            numOfCorrectSceneBG = 0
            incorrectTouches = 0
            correctTouches = 0
            
            // transition scene back to start
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
        }

    }
}


