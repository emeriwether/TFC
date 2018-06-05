//
//  Monster_T2.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/21/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class Monster_T2: SKScene {
    //Timer Variables
    var gameTimer: Timer!
    var gameCounter = 0
    
    //Local variables for basket and apple nodes
    private var foodNode:SKSpriteNode?
    private var basketNode:SKSpriteNode?
    
    //Local variables to track node selection
    private var selectedNode:SKSpriteNode?
    private var nodeIsSelected:Bool?
    
    //Variables for score tracking
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    
    //Variables for audio completion tracking
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    
    var sceneOver = false
    
    //Set up all SpriteNodes on screen and play audio instructions
    override func didMove(to view: SKView) {
        foodNode = (self.childNode(withName: "apple") as! SKSpriteNode)
        basketNode = (self.childNode(withName: "basket") as! SKSpriteNode)
        playInstructionsWithName(audioName: "instructions_apple2")
        
    }
    
    ////////////////////////////
    /////Helper Functions///////
    ////////////////////////////
    @objc func runTimedCode(){
        if gameCounter == 60{
            nextScene(sceneName: "Monster_T3")
        } else if gameCounter%20 == 0 && gameCounter != 0{
            playFeedbackWithName(audioName: "reminder_trainer")
            gameCounter = gameCounter + 1
        }else{
            gameCounter = gameCounter + 1
        }
    }
    
    //Plays audio with with specified audio file name, change appropriate variables for instructions
    func playInstructionsWithName(audioName:String){
        instructionsComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        self.run(instructions, completion: {
            self.instructionsComplete = true
            self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runTimedCode), userInfo: nil, repeats: true)
            
        })
    }
    
    //Plays audio with with specified audio file name, change appropriate variables for feedback sounds
    func playFeedbackWithName(audioName:String){
        feedbackComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        basketNode!.run(instructions, completion: { self.feedbackComplete = true })
    }
    
    //Changes basket image to completed image of basket
    func changeBasket(){
        basketNode?.texture = SKTexture(imageNamed: "BasketApple")
    }
    
    //Transition to next scene of specified name given
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
        //If NO audio is playing and the Scene is not over
        if (instructionsComplete == true) && (feedbackComplete == true) && (sceneOver == false){
            //Get location of touch
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            //Verify if the touch was inside the apple node
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
        //If NO audio is playing, the scene is not over, and a node has been selected
        if  (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true) {
            for touch in touches{
                //Update the position of the Node as it moves
                let location = touch.location(in: self)
                selectedNode?.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //If NO auido is playing, the scene is not over, and a node is selected
        if (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true){
            //Get location of touch release
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            //Check the location of touch release and iterate through all node at that location
            for items in self.nodes(at: touchLocation){
                //If over the basket
                if items.name == "basket"{
                    //Verify that the apple is selected and over the basket
                    if (selectedNode?.name == "apple"){
                        //Update variables and transition to next scene
                        apple_correctTouches += 1
                        selectedNode?.removeFromParent()
                        changeBasket()
                        sceneOver = true
                        playFeedbackWithName(audioName: "correct")
                        nextScene(sceneName: "Monster_T3")
                    }else{
                        //Give audio feedback
                        playFeedbackWithName(audioName: "wrong")
                        apple_incorrectTouches += 1
                        //If 10 incorrect moves have occured, change to next scene
                        if apple_incorrectTouches > 10{
                            sceneOver = true
                            nextScene(sceneName: "Monster_T3")
                        }
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}


