//
//  CandyScene.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/21/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class CandyScene: SKScene {
    
    private var foodNode1:SKNode?
    private var foodNode2:SKNode?
    private var monsterNode:SKNode?
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    
    var candy_incorrectTouches = 0
    var candy_correctTouches = 0
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        foodNode1 = self.childNode(withName: "carrot")
        foodNode2 = self.childNode(withName: "candy")
        monsterNode = self.childNode(withName: "Monster")
        playInstructionsWithName(audioName: "instructions_candy")
    }
    
    ////////////////////////////
    /////Helper Functions///////
    ////////////////////////////
    func playInstructionsWithName(audioName:String){
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        self.run(instructions, completion: { self.instructionsComplete = true })
    }
    
    func playFeedbackWithName(audioName:String){
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
            if (self.atPoint(touchLocation).name == "carrot"){
                selectedNode = foodNode1
                nodeIsSelected = true
            } else if (self.atPoint(touchLocation).name == "candy"){
                selectedNode = foodNode2
                nodeIsSelected = true
            }else{
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                self.run(wrong, completion: {self.feedbackComplete = true})
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
                    if (selectedNode?.name == "candy"){
                        candy_correctTouches += 1
                        selectedNode?.removeFromParent()
                        
                        let openMouth = SKTexture(imageNamed: "monsterScene_stillMonster")
                        let closedMouth = SKTexture(imageNamed: "monsterScene_chewingMonster")
                        let animation = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.2)
                        let openMouthAction = SKAction.repeat(animation, count: 5)
                        let chewing = SKAction.playSoundFileNamed("Sound_Chewing", waitForCompletion: true)
                        monsterNode!.run(openMouthAction)
                        monsterNode!.run(chewing)
                        sceneOver = true
                        animateMonster(withAudio: "Sound_Chewing")
                        nextScene(sceneName: "OrangeScene")
                    }else{
                        playFeedbackWithName(audioName: "wrong")
                        candy_incorrectTouches += 1
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}

