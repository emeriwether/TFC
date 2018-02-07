
import SpriteKit

class GameScene: SKScene {

    var navigation:SKNode!
    var closeButton: SKSpriteNode!
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
        navigation = childNode(withName: "navigation")
        closeButton = childNode(withName: "//closeButton") as! SKSpriteNode
    }
    
    func goToScene(scene: SKScene) {
        let sceneTransition = SKTransition.fade(with: UIColor.darkGray, duration: 1)
        scene.scaleMode = .aspectFill
        self.view?.presentScene(scene, transition: sceneTransition)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if navigation.contains(touchLocation) {
            let location = touch.location(in: navigation)
            if closeButton.contains(location) {
                let scoreScene = SKScene(fileNamed: "ScoreScene")
                scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(scoreScene!)
            }
        }
    }
}
