import SpriteKit
import GameplayKit
import AVFoundation

class PianoScene4: SKScene, AVAudioPlayerDelegate {
    
    private var instructionAudio:AVAudioPlayer?
    private var correctAudio: AVAudioPlayer?
    private var targetItem:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        let instructionPath = Bundle.main.path(forResource: "Find the glass", ofType:"wav")!
        let correctPath = Bundle.main.path(forResource: "D", ofType:".wav")!
        let InstructionUrl = URL(fileURLWithPath: instructionPath)
        let correctUrl = URL(fileURLWithPath: correctPath)
        
        do {
            instructionAudio = try AVAudioPlayer(contentsOf: InstructionUrl)
            correctAudio = try AVAudioPlayer(contentsOf: correctUrl)
        } catch {
            print("Error with the audio.")
        }
        instructionAudio?.delegate = self
        self.view?.isUserInteractionEnabled = false
        instructionAudio?.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let position = touch?.location(in: self)
        correctAudio?.delegate = self
        if (targetItem?.contains((position)!))!{
            correctAudio?.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if player == instructionAudio{
            self.view?.isUserInteractionEnabled = true
        }
        if player == correctAudio{
            let nextScene = SKScene(fileNamed: "PianoScene5")
            let fade = SKTransition.crossFade(withDuration: 0.7)
            self.scene?.view?.presentScene(nextScene!, transition: fade)
        }
    }
}
