//
//  StartScene.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 11/4/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class StartScene: SKScene {
    
    let start = SKSpriteNode(imageNamed: "startButton")
    
    override func didMove(to view: SKView) {
        start.position = CGPoint(x: 0, y: 0)
        start.setScale(2)
        self.addChild(start)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       let touch = touches.first!
        
        if start.contains(touch.location(in: self)) {
            let duckScene = SKScene(fileNamed: "DuckScene")
            duckScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(duckScene!, transition: fade)
        }
    }

}

