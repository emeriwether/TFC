//
//  Monster_T1.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/21/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class Monster_T1: SKScene {
    
    private var foodNode:SKSpriteNode?
    private var basketNode:SKSpriteNode?
    
    private var selectedNode:SKSpriteNode?
    private var nodeIsSelected:Bool?
    
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        foodNode = (self.childNode(withName: "apple") as! SKSpriteNode)
        basketNode = (self.childNode(withName: "basket") as! SKSpriteNode)
        playInstructionsWithName(audioName: "instructions_apple1")
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
        basketNode!.run(instructions, completion: { self.feedbackComplete = true })
    }
    
    func changeBasket(){
        basketNode?.texture = SKTexture(imageNamed: "BasketApple")
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
            if (self.atPoint(touchLocation).name == "apple"){
                selectedNode = foodNode
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
                if items.name == "basket"{
                    if (selectedNode?.name == "apple"){
                        apple_correctTouches += 1
                        selectedNode?.removeFromParent()
                        changeBasket()
                        sceneOver = true
                        playFeedbackWithName(audioName: "correct")
                        nextScene(sceneName: "Monster_T2")
                    }else{
                        playFeedbackWithName(audioName: "wrong")
                        apple_incorrectTouches += 1
                        if apple_incorrectTouches > 10{
                            sceneOver = true
                            nextScene(sceneName: "Monster_T2")
                        }
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}


