//
//  PizzaScene.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 1/14/18.
//  Copyright © 2018 Gustavo C Figueroa. All rights reserved.
//

import SpriteKit

class PizzaScene: SKScene {
    //local variable for SpriteNode that will be over the training object
    private var pizza:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var pizza_incorrectTouches = 0
    var pizza_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Connect variable with .sks file
        self.pizza = self.childNode(withName: "pizza") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.pizza_correctTouches == 0 && self.pizza_incorrectTouches == 0 {
                self.reminderComplete = false
                let pizza_reminder = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
                self.run(pizza_reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If pizza sprite is touched...
            if (pizza?.contains(touch.location(in: self)))! {
                pizza_correctTouches += 1
                correctTouches += 1
                
                // Color pizza
                pizza?.texture = SKTexture(imageNamed: "colorTrainer_pizza_colored")
                
                // Play crunch noise
                let correct = SKAction.playSoundFileNamed("correct", waitForCompletion: true)
                pizza?.run(correct)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let burgerScene = SKScene(fileNamed: "BurgerScene")
                    burgerScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(burgerScene!)
                }
            }
            else {
                pizza_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if pizza_incorrectTouches == 3 && pizza_correctTouches < 1 {
                reminderComplete = false
                let pizza_reminder = SKAction.playSoundFileNamed("instructions_pizza", waitForCompletion: true)
                run(pizza_reminder, completion: { self.reminderComplete = true} )
            }
        }
    }
}


