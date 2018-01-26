import SpriteKit

class PianoScene8: SKScene {
    
    private var targetItem:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var piano8_incorrectTouches = 0
    var piano8_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for instruction item
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.piano8_correctTouches == 0 && self.piano8_incorrectTouches == 0 {
                //May not run if 1 touch is made and may not loop.
                self.reminderComplete = false
                let reminder = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
                self.run(reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (reminderComplete == true) {
            let touch = touches.first!
            
            //If target key sprite is touched...
            if (targetItem?.contains(touch.location(in: self)))! {
                piano8_correctTouches += 1
                correctTouches += 1
                
                //Add correct press audio sound
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let pianoScene8 = SKScene(fileNamed: "PianoScene9")
                    pianoScene8?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(pianoScene8!)
                }
                
            }
            else {
                piano8_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if piano8_incorrectTouches == 3 && piano8_correctTouches < 1 {
                reminderComplete = false
                let piano8_reminder = SKAction.playSoundFileNamed("instructions_piano8", waitForCompletion: true)
                run(piano8_reminder, completion: { self.reminderComplete = true} )
            }
            
        }
        
    }
}


