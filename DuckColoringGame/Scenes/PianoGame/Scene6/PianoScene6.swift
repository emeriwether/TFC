import SpriteKit
import GameplayKit
import AVFoundation

class PianoScene6: SKScene {
    
    private var correctAudio: AVAudioPlayer?
    private var targetItem:SKSpriteNode?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var duck_incorrectTouches = 0
    var duck_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for instruction item
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("find the jacket", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.duck_correctTouches == 0 && self.duck_incorrectTouches == 0 {
                //May not run if 1 touch is made and may not loop.
                self.reminderComplete = false
                let reminder = SKAction.playSoundFileNamed("find the jacket", waitForCompletion: true)
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
            
            //If duck sprite is touched...
            if (targetItem?.contains(touch.location(in: self)))! {
                duck_correctTouches += 1
                correctTouches += 1
                
                //Add correct press audio sound
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let cookieScene = SKScene(fileNamed: "PianoScene7")
                    cookieScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(cookieScene!)
                }
                
            }
            else {
                duck_incorrectTouches += 1
                incorrectTouches += 1
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if duck_incorrectTouches == 3 && duck_correctTouches < 1 {
                reminderComplete = false
                let duck_reminder = SKAction.playSoundFileNamed("find the jacket", waitForCompletion: true)
                run(duck_reminder, completion: { self.reminderComplete = true} )
            }
            
        }
        
    }
}


