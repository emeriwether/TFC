import SpriteKit
import GameplayKit
import AVFoundation

class PianoScene2: SKScene, AVAudioPlayerDelegate {
    
    private var instructionAudio:AVAudioPlayer?
    private var correctAudio: AVAudioPlayer?
    private var targetItem:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        //Add the SpriteNode for instruction item
        self.targetItem = self.childNode(withName: "targetItem") as? SKSpriteNode
        
        //Create the URL for the audio files
        let instructionPath = Bundle.main.path(forResource: "Are you ready for more Now find the bathtub", ofType:"wav")!
        let correctPath = Bundle.main.path(forResource: "D", ofType:".wav")!
        let InstructionUrl = URL(fileURLWithPath: instructionPath)
        let correctUrl = URL(fileURLWithPath: correctPath)
        
        //Check that the files exist and create AudioPlayers with them loaded
        do {
            instructionAudio = try AVAudioPlayer(contentsOf: InstructionUrl)
            correctAudio = try AVAudioPlayer(contentsOf: correctUrl)
        } catch {
            print("Error with the audio.")
        }
        
        //Set the event handler to watch out for when the instruction audio has ended
        instructionAudio?.delegate = self
        
        //disable all touch interactions
        self.view?.isUserInteractionEnabled = false
        
        //Play instructions
        instructionAudio?.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Get the location of the first touch on the screen
        let touch = touches.first
        let position = touch?.location(in: self)
        
        //if the location of the touch is in the space of the target location, play piano note and transition screens
        correctAudio?.delegate = self
        if (targetItem?.contains((position)!))!{
            correctAudio?.play()
        }
    }
    
    //event handler for when instruction audio ends
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        //re-enable screen at the end of audio delate playing.
        if player == instructionAudio{
            self.view?.isUserInteractionEnabled = true
        }
        if player == correctAudio{
            let nextScene = SKScene(fileNamed: "PianoScene3")
            let fade = SKTransition.crossFade(withDuration: 0.7)
            self.scene?.view?.presentScene(nextScene!, transition: fade)
        }
    }
}

