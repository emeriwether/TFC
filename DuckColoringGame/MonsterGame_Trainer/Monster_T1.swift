import SpriteKit
import GameplayKit

class Monster_T1: SKScene {
    
    //Create SpriteNode for dragging object
    private var dragObject:SKSpriteNode?
    //Create Drop Zone Node
    private var targetZone:SKSpriteNode?
    //Variable to store original location of dragging
    private var defaultPosition:CGPoint?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variables to keep track of touches for this scene
    var apple_incorrectTouches = 0
    var apple_correctTouches = 0
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for dragging item
        self.dragObject = self.childNode(withName: "appleObject") as? SKSpriteNode
        //Store the initial position of the dragging object
        defaultPosition = dragObject?.position
//        //Add background node
//        self.backgroundObject = self.childNode(withName: "background") as? SKSpriteNode
        //Add drop zone node
        self.targetZone = self.childNode(withName: "boundry") as? SKSpriteNode
        
        // run the introductory instructions
        let instructions = SKAction.playSoundFileNamed("find the dress", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        // if the scene has not been touched for 10 seconds, play the reminder instructions; repeat forever
        let timer = SKAction.wait(forDuration: 10.0)
        let reminderIfIdle = SKAction.run {
            if self.apple_correctTouches == 0 && self.apple_incorrectTouches == 0 {
                self.reminderComplete = false
                let reminder = SKAction.playSoundFileNamed("find the dress", waitForCompletion: true)
                self.run(reminder, completion: { self.reminderComplete = true} )
            }
        }
        let idleSequence = SKAction.sequence([timer, reminderIfIdle])
        let repeatIdleSequence = SKAction.repeatForever(idleSequence)
        run(repeatIdleSequence)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //As the screen detects that
//        print(touches.first?.location(in: self))
//        print(self.atPoint((touches.first?.location(in: self))!))
        if self.atPoint((touches.first?.location(in: self))!).name == "appleObject"{
            for touch in touches{
                let location = touch.location(in: self)
                dragObject?.position.x = location.x
                dragObject?.position.y = location.y
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if (targetZone?.contains((dragObject?.position)!))!{
            apple_correctTouches += 1
            correctTouches += 1
            dragObject?.removeFromParent()
            targetZone?.texture = SKTexture(imageNamed: "BasketApple")
            
            let fadeOut = SKAction.fadeOut(withDuration:1)
                let wait2 = SKAction.wait(forDuration: 1)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let monsterSceneT2 = SKScene(fileNamed: "Monster_T2")
                    monsterSceneT2?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(monsterSceneT2!)}
        }
        else{
            dragObject?.position = defaultPosition!
            apple_incorrectTouches += 1
            incorrectTouches += 1
        }
    }
}



