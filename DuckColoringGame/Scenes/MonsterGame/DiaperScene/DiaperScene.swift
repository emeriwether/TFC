//
//  DiaperScene.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class DiaperScene: SKScene {
    
    private var foodNode1:SKNode?
    private var foodNode2:SKNode?
    private var foodNode3:SKNode?
    private var foodNode4:SKNode?
    private var monsterNode:SKNode?
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    
    private var diaper_incorrectTouches = 0
    private var diaper_correctTouches = 0
    
    private var instructionsComplete:Bool = false
    private var feedbackComplete:Bool = true
    
    private var sceneOver = false
    
    override func didMove(to view: SKView) {
        foodNode1 = self.childNode(withName: "diaper")
        foodNode2 = self.childNode(withName: "hair")
        foodNode3 = self.childNode(withName: "peny")
        foodNode4 = self.childNode(withName: "bat")
        monsterNode = self.childNode(withName: "Monster")
        playInstructionsWithName(audioName: "instructions_diaper")
    }
    
    ////////////////////////////
    /////Helper Functions///////
    ////////////////////////////
    func playInstructionsWithName(audioName:String){
        instructionsComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        self.run(instructions, completion: { self.instructionsComplete = true })
    }
    
    func playFeedbackWithName(audioName:String){
        feedbackComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        monsterNode!.run(instructions, completion: { self.feedbackComplete = true })
    }
    
    func animateMonster(withAudio:String) {
        let openMouth = SKTexture(imageNamed: "monsterScene_stillMonster")
        let closedMouth = SKTexture(imageNamed: "monsterScene_chewingMonster")
        let animation = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.2)
        let openMouthAction = SKAction.repeat(animation, count: 10)
        monsterNode!.run(openMouthAction)
        playFeedbackWithName(audioName: withAudio)
    }
    
    func nextScene(sceneName:String){
        let fadeOut = SKAction.fadeOut(withDuration:1)
        let wait2 = SKAction.wait(forDuration: 1)
        let sequenceFade = SKAction.sequence([wait2, fadeOut])
        run(sequenceFade) {
            let sceneToLoad = SKScene(fileNamed: sceneName)
            sceneToLoad?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(sceneToLoad!)}
    }
    ////////////////////////////
    ////////////////////////////
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (feedbackComplete == true) && (sceneOver == false){
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            if (self.atPoint(touchLocation).name == "diaper"){
                selectedNode = foodNode1
                nodeIsSelected = true
            } else if (self.atPoint(touchLocation).name == "hair"){
                selectedNode = foodNode2
                nodeIsSelected = true
            }else if (self.atPoint(touchLocation).name == "penny"){
                selectedNode = foodNode3
                nodeIsSelected = true
            }else if (self.atPoint(touchLocation).name == "bat"){
                selectedNode = foodNode4
                nodeIsSelected = true
            }else{
                playFeedbackWithName(audioName: "wrong")
                selectedNode = nil
                nodeIsSelected = false
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if  (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true) {
            for touch in touches{
                let location = touch.location(in: self)
                selectedNode?.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true){
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            
            for items in self.nodes(at: touchLocation){
                if items.name == "Monster"{
                    if (selectedNode?.name == "diaper"){
                        diaper_correctTouches += 1
                        selectedNode?.removeFromParent()
                        sceneOver = true
                        animateMonster(withAudio: "Sound_Chewing")
                        nextScene(sceneName: "MoonScene_Monster")
                    }else{
                        playFeedbackWithName(audioName: "wrong")
                        diaper_incorrectTouches += 1
                        if diaper_incorrectTouches > 10{
                            sceneOver = true
                            nextScene(sceneName: "MoonScene_Monster")
                        }
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}






