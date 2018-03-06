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
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    private var defaultNodePosition:CGPoint?
    //private var firstTouch:Bool?
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    var sceneOver = false
    
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    //var totalTouches = 0
    //var counter = 0
    
    override func didMove(to view: SKView) {
        self.foodNode = self.childNode(withName: "apple") as? SKSpriteNode
        self.basketNode = self.childNode(withName: "basket") as? SKSpriteNode
        
        selectedNode = nil
        nodeIsSelected = false
        //firstTouch = false
        
        let instructions = SKAction.playSoundFileNamed("instructions_apple1", waitForCompletion: true)
        self.run(instructions, completion: {self.instructionsComplete = true})
        //        let waitTimer = SKAction.wait(forDuration: 5.0)
        //
        //        basketNode?.run(SKAction.sequence([instructions, waitTimer,instructions, waitTimer]),completion: {self.instructionsComplete = true})
        //        let audioR = SKAction.run{
        //            if (self.counter % 10 == 0) && (self.apple_incorrectTouches + self.apple_correctTouches == 0){
        //                self.instructionsComplete = false
        //
        //            }else{
        //                self.run(SKAction.wait(forDuration: 1.0))
        //                self.counter += 1
        //            }
        //        }
        //        self.run(SKAction.repeatForever(audioR))
        //basketNode?.run(instructions, completion: {self.instructionsComplete = true})
        
        //        /////////////////////////////////
        //        ////// IDLE REMINDER TIMER //////
        //        /////////////////////////////////
        //        let oneSecTimer = SKAction.wait(forDuration: 1.0)
        //        var timerCount = 1
        //        var currentTouches = 0
        //
        //        // set up sequence for if the scene has not been touched for 10 seconds: play the idle reminder
        //        let reminderIfIdle = SKAction.run {
        //            self.reminderComplete = false
        //            let apple_reminder = SKAction.playSoundFileNamed("instructions_apple1", waitForCompletion: true)
        //            self.basketNode?.run(apple_reminder, completion: { self.reminderComplete = true} )
        //        }
        //
        //        // for every one second, do this action:
        //        let timerAction = SKAction.run {
        //            // if no touch...
        //            if (self.totalTouches - currentTouches == 0) {
        //                // ...timer progresses one second...
        //                timerCount += 1
        //            }
        //                // ... else if a touch...
        //            else {
        //                // ... increase touch count...
        //                currentTouches += 1
        //                // ... and start timer over...
        //                timerCount = 1
        //            }
        //            // if timer seconds are divisable by 10 ...
        //            if (timerCount % 10 == 0) {
        //                // ... play the reminder.
        //                self.run(reminderIfIdle)
        //            }
        //        }
        //        // set up sequence: run 1s timer, then play action
        //        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        //        // repeat the timer forever
        //        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        //        run(repeatTimerActionSequence)
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
                            let monsterSceneT2 = SKScene(fileNamed: "Monster_T2")
                            monsterSceneT2?.scaleMode = SKSceneScaleMode.aspectFill
                            self.scene!.view?.presentScene(monsterSceneT2!)}
                    }else{
                        selectedNode = nil
                        nodeIsSelected = false
                        apple_incorrectTouches += 1
                        //incorrectTouches += 1
                    }
                }
            }
            
        }
        //        if (apple_incorrectTouches % 3 == 0) && (apple_correctTouches < 1) && (!(basketNode?.hasActions())!){
        //            reminderComplete = false
        //            let apple_reminder = SKAction.playSoundFileNamed("reminder_apple1", waitForCompletion: true)
        //            self.basketNode?.run(apple_reminder, completion: { self.reminderComplete = true} )
        //        }
        //totalTouches = apple_correctTouches + apple_incorrectTouches
    }
}
