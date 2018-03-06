//
//  Monster_T1.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/21/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class Monster_T4: SKScene {
    
    private var foodNode:SKSpriteNode?
    private var basketNode:SKSpriteNode?
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    //private var defaultNodePosition:CGPoint?
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    var sceneOver = false
    
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    
    override func didMove(to view: SKView) {
        self.foodNode = self.childNode(withName: "apple") as? SKSpriteNode
        self.basketNode = self.childNode(withName: "basket") as? SKSpriteNode
        
        selectedNode = nil
        nodeIsSelected = false
        
        let instructions = SKAction.playSoundFileNamed("instructions_apple3", waitForCompletion: true)
        self.run(instructions, completion: {self.instructionsComplete = true})
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (feedbackComplete == true) && (sceneOver == false){
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            if (self.atPoint(touchLocation).name == "apple"){
                selectedNode = foodNode
                nodeIsSelected = true
            } else{
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
                if items.name == "basket"{
                    if (selectedNode?.name == "apple"){
                        apple_correctTouches += 1
                        selectedNode?.removeFromParent()
                        basketNode?.texture = SKTexture(imageNamed: "BasketApple")
                        selectedNode = nil
                        nodeIsSelected = false
                        sceneOver = true
                        feedbackComplete = false
                        let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                        self.run(correct, completion: {self.feedbackComplete = true})
                        let fadeOut = SKAction.fadeOut(withDuration:1)
                        let wait2 = SKAction.wait(forDuration: 1)
                        let sequenceFade = SKAction.sequence([wait2, fadeOut])
                        run(sequenceFade) {
                            let juicescene = SKScene(fileNamed: "JuiceScene")
                            juicescene?.scaleMode = SKSceneScaleMode.aspectFill
                            self.scene!.view?.presentScene(juicescene!)}
                    }else{
                        selectedNode = nil
                        nodeIsSelected = false
                        apple_incorrectTouches += 1
                        //incorrectTouches += 1
                    }
                }
            }
            
        }
    }
}



