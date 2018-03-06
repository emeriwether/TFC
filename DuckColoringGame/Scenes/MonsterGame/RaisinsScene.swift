//
//  Monster_T1.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 2/16/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class RaisinsScene: SKScene {
    
    // Variables for tracking nodes on screen
    private var item1Node:SKNode?
    private var item2Node:SKNode?
    private var item3Node:SKNode?
    private var monsterNode:SKNode?
    
    // Variables for tracking SpriteNode that is being dragged
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    
    // Variable to track location of dragged item's original position
    private var defaultNodePosition:CGPoint?
    
    var bug_incorrectTouches = 0
    var bug_correctTouches = 0
    var totalTouches = 0
    
    // Local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        // Link SKS to appropriate variables
        monsterNode = self.childNode(withName: "Monster")
        item1Node = self.childNode(withName: "item1")
        item2Node = self.childNode(withName: "item2")
        item3Node = self.childNode(withName: "item3")
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_raisins", waitForCompletion: true)
        monsterNode?.run(instructions, completion: { self.instructionsComplete = true })
        
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
        //            let bug_reminder = SKAction.playSoundFileNamed("instructions_bug", waitForCompletion: true)
        //            self.monsterNode?.run(bug_reminder, completion: { self.reminderComplete = true} )
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
        //                self.monsterNode?.run(reminderIfIdle)
        //            }
        //        }
        //        // set up sequence: run 1s timer, then play action
        //        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        //        // repeat the timer forever
        //        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        //        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If no audio is playing and the scene is not over...
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            // If a touch is detected on item 1...
            if (self.atPoint((touch.location(in: self))).name == "item1") && (sceneOver == false) {
                // Update variables to track item 1
                selectedNode = item1Node
                nodeIsSelected = true
                defaultNodePosition = selectedNode?.position
                // Else if a touch is detected on item 2...
            }else if (self.atPoint((touch.location(in: self))).name == "item2") && (sceneOver == false){
                // Update variables to track item 2
                selectedNode = item2Node
                nodeIsSelected = true
                defaultNodePosition = selectedNode?.position
            }else if (self.atPoint((touch.location(in: self))).name == "item3") && (sceneOver == false){
                // Update variables to track item 2
                selectedNode = item3Node
                nodeIsSelected = true
                defaultNodePosition = selectedNode?.position
            }else{
                // Else update variables to reflect that no item has been touched
                selectedNode = nil
                nodeIsSelected = false
            }
        }
        //totalTouches = bug_correctTouches + bug_incorrectTouches
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If an item is selected, no audio is playing, and the scene is not over...
        if (nodeIsSelected == true) && (sceneOver == false) && (instructionsComplete == true) && (reminderComplete == true){
            for touch in touches{
                // Update the location of the selected item as it it dragged across the screen
                let location = touch.location(in: self)
                selectedNode?.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        // If, at the point the user releases their touch, contains the Monster object, and item is selcted,
        // and the selected object is item1 (the correct item)...
        if (self.atPoint((touch?.location(in: self))!).name == "Monster") && (nodeIsSelected == true) && (sceneOver == false){
            if (selectedNode == item1Node){
                // Award points for correct touch
                bug_correctTouches += 1
                //correctTouches += 1
                // Remove the selected object from the screen
                selectedNode?.removeFromParent()
                selectedNode = nil
                nodeIsSelected = false
                sceneOver = true
                
                //Variables for open mouth animation
                let openMouth = SKTexture(imageNamed: "StillMonster-1")
                let closedMouth = SKTexture(imageNamed: "ChewingMonster1")
                let animation = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.2)
                let openMouthAction = SKAction.repeat(animation, count: 5)
                //Variables for chewing audio
                let chewing = SKAction.playSoundFileNamed("Sound_Chewing", waitForCompletion: true)
                
                //Run all actions
                monsterNode!.run(openMouthAction)
                monsterNode!.run(chewing)
                
                //Set and Run instructions for  Scene transition
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                self.monsterNode?.run(sequenceFade) {
                    let ScoreScene = SKScene(fileNamed: "ScoreScene")
                    ScoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(ScoreScene!)}
            }else if (selectedNode == item2Node){
                selectedNode?.position = defaultNodePosition!
                selectedNode = nil
                nodeIsSelected = false
                bug_incorrectTouches += 1
                //incorrectTouches += 1
            }else if (selectedNode == item3Node){
                selectedNode?.position = defaultNodePosition!
                selectedNode = nil
                nodeIsSelected = false
                bug_incorrectTouches += 1
                //incorrectTouches += 1
            }
        } else if (nodeIsSelected == true) && (sceneOver == false) && (self.atPoint((touch?.location(in: self))!).name != "Monster"){
            selectedNode?.position = defaultNodePosition!
            selectedNode = nil
            nodeIsSelected = false
            bug_incorrectTouches += 1
            //incorrectTouches += 1
        }else{
            selectedNode = nil
            nodeIsSelected = false
            bug_incorrectTouches += 1
            //incorrectTouches += 1
        }
        
        //        // play reminder instructions if user has touched screen 3 times incorrectly
        //        if (bug_incorrectTouches % 3 == 0) && (bug_correctTouches < 1) && sceneOver == false{
        //            reminderComplete = false
        //            let bug_reminder = SKAction.playSoundFileNamed("reminder_duck", waitForCompletion: true)
        //            self.monsterNode?.run(bug_reminder, completion: { self.reminderComplete = true} )
        //        }
        //
        //        totalTouches = bug_correctTouches + bug_incorrectTouches
    }
}

