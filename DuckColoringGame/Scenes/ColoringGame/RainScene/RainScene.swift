//
//  RainScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class RainScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var rain_incorrectTouches = 0
    var rain_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
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
            let rain_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
            self.run(rain_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for rain sprite
        let rain = self.childNode(withName: "rain_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            //If rain sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == rain?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                rain_correctTouches += 1
                correctTouches += 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (rain_incorrectTouches == 0) {
                    numOfCorrectFirstTry += 1
                    numOfCorrectSimpleBG += 1
                    numOfCorrectSetSize4 += 1
                    
                    correctFirstTriesArray.append("rain")
                    correctTouchesArray.append("rain")
                    correctSetSize4.append("rain")
                    correctBGSimple.append("rain")
                }
                
                // Change sprite to colored rain
                let coloredrain:SKTexture = SKTexture(imageNamed: "rainScene_rain_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredrain], timePerFrame: 0.0001)
                rain!.run(changeToColored)
                
                //Variables for rain audio
                let rainstick = SKAction.playSoundFileNamed("rain", waitForCompletion: true)
                
                //Run all actions
                rain!.run(rainstick)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let duckScene = SKScene(fileNamed: "DuckScene")
                    duckScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(duckScene!)
                }
            }
            else {
                rain_incorrectTouches += 1
                incorrectTouches += 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                rain?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (rain_incorrectTouches % 3 == 0) && rain_correctTouches < 1 {
                reminderComplete = false
                let rain_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
                run(rain_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = rain_correctTouches + rain_incorrectTouches
    }
}







