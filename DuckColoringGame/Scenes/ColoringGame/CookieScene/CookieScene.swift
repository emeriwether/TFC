//
//  CookieScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class CookieScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true

    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var cookie_incorrectTouches = 0
    var cookie_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_cookie", waitForCompletion: true)
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
            let cookie_reminder = SKAction.playSoundFileNamed("reminder_cookie", waitForCompletion: true)
            self.run(cookie_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for cookie sprite
        let cookie = self.childNode(withName: "cookie_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false)  {
            let touch = touches.first!
        
            //If cookie sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == cookie?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                cookie_correctTouches += 1
                numCorrectPerScene["cookie"] = numCorrectPerScene["cookie"]! + 1

                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (cookie_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    sceneCorrectFT += 1
                    fourItemCorrectFT += 1
                    correctFirstTriesArray.append("cookie")
                }
                
                // Change sprite to colored cookie
                let coloredCookie:SKTexture = SKTexture(imageNamed: "cookieScene_cookie_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredCookie], timePerFrame: 0.0001)
                cookie!.run(changeToColored)
                
                // Variable for crunch noise
                let crunch = SKAction.playSoundFileNamed("crunch", waitForCompletion: true)
                
                // Variables for bite action
                let biteOne = SKTexture(imageNamed: "cookieScene_cookie_colored_bite1")
                let biteTwo = SKTexture(imageNamed: "cookieScene_cookie_colored_bite2")
                let animationBite = SKAction.animate(with: [biteOne, biteTwo], timePerFrame: 0.5)
                
                // Run all actions
                cookie!.run(animationBite)
                cookie!.run(crunch)

                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let mouseScene = SKScene(fileNamed: "MouseScene")
                    mouseScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(mouseScene!)
                }
            }
            else {
                cookie_incorrectTouches += 1
                numIncorrectPerScene["cookie"] = numIncorrectPerScene["cookie"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                cookie?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (cookie_incorrectTouches % 3 == 0) && cookie_correctTouches < 1 {
                reminderComplete = false
                let cookie_reminder = SKAction.playSoundFileNamed("reminder_cookie", waitForCompletion: true)
                run(cookie_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = cookie_correctTouches + cookie_incorrectTouches
    }
}

