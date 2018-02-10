//
//  PizzaScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class PizzaScene: SKScene {
    // local variables to keep track of touches for this scene
    var pizza_incorrectTouches = 0
    var pizza_correctTouches = 0
    var totalTouches = 0
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
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
            let pizza_reminder = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
            self.run(pizza_reminder, completion: { self.reminderComplete = true} )
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
        // local variable for pizza sprite
        let pizza = self.childNode(withName: "pizza_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            //If pizza sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == pizza?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                pizza_correctTouches += 1
                correctTouches += 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (pizza_incorrectTouches == 0) {
                    numOfCorrectFirstTry += 1
                    numOfCorrectSimpleBG += 1
                    numOfCorrectSetSize2 += 1
                }
                
                // Change sprite to colored pizza
                let coloredPizza:SKTexture = SKTexture(imageNamed: "pizzaScene_pizza_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredPizza], timePerFrame: 0.0001)
                pizza!.run(changeToColored)
                
                //Variables for pizza audio
                let western = SKAction.playSoundFileNamed("quack", waitForCompletion: true)
                //Variables for move animation
                let move = SKAction.moveTo(x: 900, duration: 3.0)
                
                //Run all actions
                pizza!.run(western)
                pizza!.run(move)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let hamburgerScene = SKScene(fileNamed: "HamburgerScene")
                    hamburgerScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(hamburgerScene!)
                }
            }
            else {
                pizza_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (pizza_incorrectTouches % 3 == 0) && pizza_correctTouches < 1 {
                reminderComplete = false
                let pizza_reminder = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
                run(pizza_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = pizza_correctTouches + pizza_incorrectTouches
    }
}




