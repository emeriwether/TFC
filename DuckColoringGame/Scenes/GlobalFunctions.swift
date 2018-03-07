//
//  GlobalFunctions.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/7/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

// generic correct animation: color, play sound, wiggle and grow/shrink
func animateNode(node: SKNode, coloredImg: String, correctSound: String) {
    // Change sprite to colored node
    let coloredNode:SKTexture = SKTexture(imageNamed: coloredImg)
    let changeToColored:SKAction = SKAction.animate(with: [coloredNode], timePerFrame: 0.0001)
    node.run(changeToColored)
    
    // Variables for correct audio
    let correct = SKAction.playSoundFileNamed(correctSound, waitForCompletion: true)
    
    // Variables for wiggle animation
    let rotR = SKAction.rotate(byAngle: 0.10, duration: 0.1)
    let rotL = SKAction.rotate(byAngle: -0.10, duration: 0.1)
    let cycle = SKAction.sequence([rotR, rotL, rotL, rotR])
    let wiggle = SKAction.repeat(cycle, count: 2)
    
    // Variables for scale animation
    let nodeScaleX = node.xScale
    let nodeScaleY = node.yScale
    let scaleUpActionX = SKAction.scaleX(to: (nodeScaleX + 0.5), duration: 0.3)
    let scaleUpActionY = SKAction.scaleY(to: (nodeScaleY + 0.5), duration: 0.3)
    let scaleUpAction = SKAction.group([scaleUpActionX, scaleUpActionY])
    let scaleDownActionX = SKAction.scaleX(to: (nodeScaleX - 0.5), duration: 0.3)
    let scaleDownActionY = SKAction.scaleY(to: (nodeScaleY - 0.5), duration: 0.3)
    let scaleDownAction = SKAction.group([scaleDownActionX, scaleDownActionY])
    let scaleToRegularX = SKAction.scaleX(to: nodeScaleX, duration: 0.3)
    let scaleToRegularY = SKAction.scaleY(to: nodeScaleY, duration: 0.3)
    let scaleToRegularAction = SKAction.group([scaleToRegularX, scaleToRegularY])
    let scaleActionSequence = SKAction.sequence([scaleUpAction, scaleDownAction, scaleToRegularAction])
    
    // Variable for sequenced animation
    let animationSequence = SKAction.group([wiggle, scaleActionSequence])
    
    //Run all actions
    node.run(changeToColored)
    node.run(correct)
    node.run(animationSequence)
}

func transitionScene (currentScene: SKScene, sceneString: String) {
    //Variables to switch screens
    let fadeOut = SKAction.fadeOut(withDuration:1)
    let wait2 = SKAction.wait(forDuration: 2)
    let sequenceFade = SKAction.sequence([wait2, fadeOut])
    currentScene.run(sequenceFade) {
        let nextScene = SKScene(fileNamed: sceneString)
        nextScene!.scaleMode = SKSceneScaleMode.aspectFill
        currentScene.scene!.view?.presentScene(nextScene)
    }
}
