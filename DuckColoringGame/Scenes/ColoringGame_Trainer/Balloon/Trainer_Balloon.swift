//
//  Trainer_Balloon.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether and Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Eleanor Meriwether and Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class Trainer_Balloon: SKScene {
    // local variables to keep track of touches for this scene
    var balloon_incorrectTouches = 0
    var balloon_correctTouches = 0
    var totalTouches = 0
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_balloon", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        /////////////////////////////////
        ////// IDLE REMINDER TIMER //////
        /////////////////////////////////
        let oneSecTimer = SKAction.wait(forDuration: 1.0)
        var timerCount = 1
        var currentTouches = 0
        
        // set up sequence for if the scene has not been touched for 10 seconds: play the idle reminder
        let reminderIfIdle = SKAction.run {
            self.reminderComplete = false
            let rock_reminder = SKAction.playSoundFileNamed("reminder_balloon", waitForCompletion: true)
            self.run(rock_reminder, completion: { self.reminderComplete = true} )
        }
        
        // for every one second, do this action:
        let timerAction = SKAction.run {
            // if no touch...
            if (self.totalTouches - currentTouches == 0) {
                // ...timer progresses one second...
                timerCount += 1
            }
                // ... else if a touch...
            else {
                // ... increase touch count...
                currentTouches += 1
                // ... and start timer over...
                timerCount = 1
            }
            // if timer seconds are divisable by 10 ...
            if (timerCount % 10 == 0) {
                // ... play the reminder.
                self.run(reminderIfIdle)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for balloon sprite
        let balloon = self.childNode(withName: "balloon")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false) {
            let touch = touches.first!
            
            //If balloon sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == balloon?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                balloon_correctTouches += 1
                
                // play correct scale&wiggle animation (function declared on Trainer_Balloon.swift in coloring game)
                animateNode(node: balloon!, coloredImg: "colorTrainer_balloon_colored", correctSound: "correct")
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let breadScene = SKScene(fileNamed: "Trainer_Bread")
                    breadScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(breadScene!)
                }
            }
            else {
                balloon_incorrectTouches += 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                balloon?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if balloon_incorrectTouches == 3 && balloon_correctTouches < 1 {
                reminderComplete = false
                let balloon_reminder = SKAction.playSoundFileNamed("reminder_balloon", waitForCompletion: true)
                run(balloon_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = balloon_correctTouches + balloon_incorrectTouches
    }
}

// generic correct animation: color, play sound, wiggle and grow/shrink
func animateNode(node: SKNode, coloredImg: String, correctSound: String) {
    // Change sprite to colored lamp
    let coloredNode:SKTexture = SKTexture(imageNamed: coloredImg)
    let changeToColored:SKAction = SKAction.animate(with: [coloredNode], timePerFrame: 0.0001)
    node.run(changeToColored)
    
    // Variables for lamp audio
    let correct = SKAction.playSoundFileNamed(correctSound, waitForCompletion: true)
    
    // Variables for wiggle animation
    let rotR = SKAction.rotate(byAngle: 0.10, duration: 0.1)
    let rotL = SKAction.rotate(byAngle: -0.10, duration: 0.1)
    let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
    let wiggle = SKAction.repeat(cycle, count: 2)
    
    // Variables for scale animation
    let nodeScaleX = node.xScale
    let nodeScaleY = node.yScale
    let scaleUpActionX = SKAction.scaleX(to: (nodeScaleX + 0.5), duration: 0.3)
    let scaleUpActionY = SKAction.scaleY(to: (nodeScaleY + 0.5), duration: 0.3)
    let scaleUpAction = SKAction.group([scaleUpActionX, scaleUpActionY])
    let scaleDownActionX = SKAction.scaleX(to: (nodeScaleX - 0.5), duration: 0.3)
    let scaleDownActionY = SKAction.scaleY(to: (nodeScaleY - 0.5), duration: 0.3)
    let scaleDownAction = SKAction.group([scaleDownActionX, scaleDownActionY])
    let scaleToRegularX = SKAction.scaleX(to: nodeScaleX, duration: 0.3)
    let scaleToRegularY = SKAction.scaleY(to: nodeScaleY, duration: 0.3)
    let scaleToRegularAction = SKAction.group([scaleToRegularX, scaleToRegularY])
    let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, scaleToRegularAction])
    
    // Variable for sequenced animation
    let animationSequence = SKAction.group([wiggle, scaleActionSequence])
    
    //Run all actions
    node.run(changeToColored)
    node.run(correct)
    node.run(animationSequence)
}
