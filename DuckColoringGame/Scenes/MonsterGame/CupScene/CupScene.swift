//
//  CupScene.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 3/5/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class CupScene: SKScene {
    //Timer Variables
    var gameTimer: Timer!
    var gameCounter = 0
    
    private var foodNode1:SKNode?
    private var foodNode2:SKNode?
    private var monsterNode:SKNode?
    private var node1Position:CGPoint?
    private var node2Position:CGPoint?
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    
    var cup_incorrectTouches = 0
    var cup_correctTouches = 0
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        foodNode1 = self.childNode(withName: "cloud")
        foodNode2 = self.childNode(withName: "cup")
        node1Position = foodNode1?.position
        node2Position = foodNode2?.position
        monsterNode = self.childNode(withName: "Monster")
        playInstructionsWithName(audioName: "instructions_cup")
        
    }
    
    ////////////////////////////
    /////Helper Functions///////
    ////////////////////////////
    @objc func runTimedCode(){
        if gameCounter == 60{
            nextScene(sceneName: "PenScene")
        } else if gameCounter%20 == 0 && gameCounter != 0{
            playFeedbackWithName(audioName: "reminder_cup")
            gameCounter = gameCounter + 1
        }else{
            gameCounter = gameCounter + 1
        }
    }
    
    func playInstructionsWithName(audioName:String){
        instructionsComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        self.run(instructions, completion: { self.instructionsComplete = true
            self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runTimedCode), userInfo: nil, repeats: true)
        })
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
    
    func animateMonster_incorrect(){
        let openMouth = SKTexture(imageNamed: "monsterScene_stillMonster")
        let sadMouth = SKTexture(imageNamed: "monsterScene_sadMonster")
        let sadAnimate = SKAction.animate(with: [sadMouth, openMouth], timePerFrame: 2)
        //let reset = SKAction.animate(with: [openMouth], timePerFrame: 0.5)
        monsterNode!.run(sadAnimate)
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
            if (self.atPoint(touchLocation).name == "cloud"){
                selectedNode = foodNode1
                nodeIsSelected = true
            } else if (self.atPoint(touchLocation).name == "cup"){
                selectedNode = foodNode2
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
                    if (selectedNode?.name == "cup"){
                        cup_correctTouches += 1
                        selectedNode?.removeFromParent()
                        sceneOver = true
                        animateMonster(withAudio: "Sound_Biting")
                        nextScene(sceneName: "PenScene")
                    }else{
                        playFeedbackWithName(audioName: "wrong")
                        animateMonster_incorrect()
                        foodNode2?.position = node2Position!
                        cup_incorrectTouches += 1
                        if cup_incorrectTouches > 15{
                            sceneOver = true
                            nextScene(sceneName: "PenScene")
                        }
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}



