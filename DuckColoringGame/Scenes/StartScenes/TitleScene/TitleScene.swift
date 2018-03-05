//
//  NameScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    
    
    override func didMove(to view: SKView) {
        
        let introSong = SKAction.playSoundFileNamed("introSong", waitForCompletion: true)
        let wait = SKAction.wait(forDuration: 1)
        
        let nameScene = SKScene(fileNamed: "NameScene")
        nameScene?.scaleMode = SKSceneScaleMode.aspectFill
        let fade = SKTransition.fade(withDuration: 0.5)
        let nextSceneAction = SKAction.run {
            self.scene!.view?.presentScene(nameScene!, transition: fade)
        }
        
        let sequenceIntro = SKAction.sequence([wait, introSong, nextSceneAction])

        //Run action sequence
        run(sequenceIntro)
    }
}




