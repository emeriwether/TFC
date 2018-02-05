import SpriteKit
import GameplayKit

class DrinkScene: SKScene {

    private var monsterObject:SKNode?
    private var item1Object:SKNode?
    private var item2Object:SKNode?
    private var objectSelected:SKNode?
    private var defaultPosition:CGPoint?
    private var objectIsSelected:Bool?
    
    // local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
//    // local variable to keep track of whether correct sprite has been touched
//    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var drink_incorrectTouches = 0
    var drink_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        monsterObject = self.childNode(withName: "Monster")
        item1Object = self.childNode(withName: "item1")
        item2Object = self.childNode(withName: "item2")
        
        // remove scene's physics body, so alpha mask on target sprite is accessible
        //self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_drink", waitForCompletion: true)
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
            let drink_reminder = SKAction.playSoundFileNamed("instructions_drink", waitForCompletion: true)
            self.run(drink_reminder, completion: { self.reminderComplete = true} )
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
            if (timerCount % 15 == 0) {
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
        let touch = touches.first
        if self.atPoint((touch?.location(in: self))!).name == "item1" {
            objectSelected = item1Object
            objectIsSelected = true
            defaultPosition = objectSelected?.position
        }else if self.atPoint((touch?.location(in: self))!).name == "item2"{
            objectSelected = item2Object
            objectIsSelected = true
            defaultPosition = objectSelected?.position
        }else{
            objectSelected = nil
            objectIsSelected = false
        }
//        if (self.item1Object?.contains((touch?.location(in: self))!))!{
//            objectIsSelected = true
//            objectSelected = item1Object
//        } else if (self.item2Object?.contains((touch?.location(in: self))!))!{
//            objectIsSelected = false
//            objectSelected = item2Object
//        }else{
//            objectIsSelected = false
//            objectSelected = nil
//        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
//            let touch = touches.first!
//
//            //If item1 sprite's alpha mask is touched...
//            if (physicsWorld.body(at: touch.location(in: self)) == self.item1Object?.physicsBody) && (sceneOver == false) {
//                self.defaultPosition = self.item1Object?.position
//                for touch in touches{
//                    let location = touch.location(in: self)
//                    self.item1Object?.position.x = location.x
//                    self.item1Object?.position.y = location.y
//                    }
//                }
//        }
//        (objectSelected?.contains((touches.first?.location(in: self))!))! && objectSelected != nil
        if objectSelected != nil{
            //defaultPosition = objectSelected?.position
            for touch in touches{
                let location = touch.location(in: self)
                objectSelected?.position = location
                //objectSelected?.position.y = location.y
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if self.atPoint((touch?.location(in: self))!).name == "Monster" && (objectIsSelected == true) && (objectSelected == item1Object){
            drink_correctTouches += 1
            correctTouches += 1
            objectSelected?.removeFromParent()
            
            let fadeOut = SKAction.fadeOut(withDuration:1)
            let wait2 = SKAction.wait(forDuration: 1)
            let sequenceFade = SKAction.sequence([wait2, fadeOut])
            run(sequenceFade) {
                let monsterSceneT2 = SKScene(fileNamed: "Monster_T2")
                monsterSceneT2?.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(monsterSceneT2!)}
        } else{
            objectSelected?.position = defaultPosition!
            drink_incorrectTouches += 1
            incorrectTouches += 1
        }
        
//        if (monsterObject?.contains((item2Object?.position)!))!{
//            drink_correctTouches += 1
//            correctTouches += 1
//            item2Object?.removeFromParent()
//
//            let fadeOut = SKAction.fadeOut(withDuration:1)
//            let wait2 = SKAction.wait(forDuration: 1)
//            let sequenceFade = SKAction.sequence([wait2, fadeOut])
//            run(sequenceFade) {
//                let monsterSceneT2 = SKScene(fileNamed: "Monster_T2")
//                monsterSceneT2?.scaleMode = SKSceneScaleMode.aspectFill
//                self.scene!.view?.presentScene(monsterSceneT2!)}
//        }
//        else{
//            item2Object?.position = defaultPosition!
//            drink_incorrectTouches += 1
//            incorrectTouches += 1
//        }
    }
}
