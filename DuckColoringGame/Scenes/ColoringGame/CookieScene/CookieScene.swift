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
        var totalTimerCount = 0
        
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
                totalTimerCount += 1
            }
                // ... else if a touch...
            else {
                // ... increase touch count...
                currentTouches += 1
                // ... and start timer over...
                timerCount = 1
            }
            // if timer seconds are divisable by 20 and totalTimerCount is less than one minute...
            if (timerCount % 20 == 0) && totalTimerCount <= 58  {
                // ... play the reminder.
                self.run(reminderIfIdle)
            }
            // if idleReminer has played 3 times in a row, move on to next scene
            if totalTimerCount > 59 {
                self.sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "MouseScene", waitTime: 0, fadeTime: 2)
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
            
            // If user makes too many incorrect touches, just move on (move on during the 15th touch)
            // incorrect touches starts at 0, so it's offset by 1
            if cookie_incorrectTouches > 13 {
                sceneOver = true
                
                transitionScene (currentScene: self, sceneString: "MouseScene", waitTime: 0, fadeTime: 2)
            }
            
            //If cookie sprite is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == cookie?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                cookie_correctTouches += 1
                numCorrectPerScene["cookie"] = numCorrectPerScene["cookie"]! + 1
                comboCompletedDict["fourItemScene"] = comboCompletedDict["fourItemScene"]! + 1

                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (cookie_incorrectTouches == 0) {
                    totalCorrectFT += 1
                    sceneCorrectFT += 1
                    fourItemCorrectFT += 1
                    correctFirstTries["cookie"] = true
                    comboNumFTDict["fourItemScene"] = comboNumFTDict["fourItemScene"]! + 1
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

                transitionScene (currentScene: self, sceneString: "MouseScene", waitTime: 2, fadeTime: 1)
            }
            else {
                cookie_incorrectTouches += 1
                numIncorrectPerScene["cookie"] = numIncorrectPerScene["cookie"]! + 1
                comboNumIncorrectDict["fourItemScene"] = comboNumIncorrectDict["fourItemScene"]! + 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                cookie?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly (don't play for 15th touch - just move on)
//            if (cookie_incorrectTouches % 3 == 0) && cookie_correctTouches < 1 && cookie_incorrectTouches < 14 {
//                reminderComplete = false
//                let cookie_reminder = SKAction.playSoundFileNamed("reminder_cookie", waitForCompletion: true)
//                run(cookie_reminder, completion: { self.reminderComplete = true} )
//            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = cookie_correctTouches + cookie_incorrectTouches
    }
}

