//
//  GlobalFunctions.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/7/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

////////////////////////////////////////////////////////////////////////////////////////////
//PUBLIC VARIABLES TO KEEP TRACK OF STATISTICS//
// scenes completed
var numOfScenesCompleted = 0.0
var twoItemCompleted = 0.0
var threeItemCompleted = 0.0
var fourItemCompleted = 0.0
var simplebgCompleted = 0.0
var linebgCompleted = 0.0
var scenebgCompleted = 0.0

///// Totals ///////////
var totalCorrectFT = 0
var twoItemCorrectFT = 0
var threeItemCorrectFT = 0
var fourItemCorrectFT = 0
var simpleCorrectFT = 0
var lineCorrectFT = 0
var sceneCorrectFT = 0

var totalAccuracy = 0.0
var twoItemAccuracy = 0.0
var threeItemAccuracy = 0.0
var fourItemAccuracy = 0.0
var simpleAccuracy = 0.0
var lineAccuracy = 0.0
var sceneAccuracy = 0.0

////// Scene Breakdowns ////////////////
var correctFirstTriesArray = [String]()
var numCorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
var numIncorrectPerScene: [String:Int] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
var accuracyPerScene: [String:Double] = ["rock": 0, "lamp": 0, "cat": 0, "lion": 0, "hand": 0, "rain": 0, "duck": 0, "moon": 0, "cow": 0, "trash": 0, "airplane": 0, "shoes": 0, "cake": 0, "stroller": 0, "toast": 0, "hat": 0, "cookie": 0, "mouse": 0]
////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//PUBLIC FUNCTIONS
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

func transitionScene (currentScene: SKScene, sceneString: String, waitTime: Double) {
    //Variables to switch screens
    let fadeOut = SKAction.fadeOut(withDuration:1)
    let wait2 = SKAction.wait(forDuration: waitTime)
    let sequenceFade = SKAction.sequence([wait2, fadeOut])
    currentScene.run(sequenceFade) {
        let nextScene = SKScene(fileNamed: sceneString)
        nextScene!.scaleMode = SKSceneScaleMode.aspectFill
        currentScene.scene!.view?.presentScene(nextScene)
    }
}


func printLabel (scene: SKScene, label: SKLabelNode, words: String, xCoord: Double, yCoord: Double, fontSize: CGFloat) {
    label.text = words
    label.fontSize = fontSize
    label.position = CGPoint(x: xCoord, y: yCoord)
    label.zPosition = 10
    label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    label.fontColor = UIColor.black
    label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    scene.addChild(label)
}

func printListLabel (scene: SKScene, label: SKLabelNode, words: String, xCoord: Double, yCoord: Double, fontSize: Int) {
    label.text = words
    label.fontSize = 20
    label.position = CGPoint(x: xCoord, y: yCoord)
    label.zPosition = 10
    label.fontColor = UIColor.black
    label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
    label.preferredMaxLayoutWidth = 1000
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.numberOfLines = 0
    label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.top
    scene.addChild(label)
}

func calculateAccuracy (scene: String) {
    if (numCorrectPerScene[scene]! == 0) { accuracyPerScene[scene] = 0 }
    else if (numIncorrectPerScene[scene]! == 0) {accuracyPerScene[scene] = 100 }
    else {
        accuracyPerScene[scene] = round((Double(numCorrectPerScene[scene]!) / Double(numIncorrectPerScene[scene]! + numCorrectPerScene[scene]!)) * 100)
    }
}

func resetAllGameStats_coloring () {
    numOfScenesCompleted = 0.0
    twoItemCompleted = 0.0
    threeItemCompleted = 0.0
    fourItemCompleted = 0.0
    simplebgCompleted = 0.0
    linebgCompleted = 0.0
    scenebgCompleted = 0.0
    
    totalCorrectFT = 0
    twoItemCorrectFT = 0
    threeItemCorrectFT = 0
    fourItemCorrectFT = 0
    simpleCorrectFT = 0
    lineCorrectFT = 0
    sceneCorrectFT = 0
    
    totalAccuracy = 0.0
    twoItemAccuracy = 0.0
    threeItemAccuracy = 0.0
    fourItemAccuracy = 0.0
    simpleAccuracy = 0.0
    lineAccuracy = 0.0
    sceneAccuracy = 0.0
    
    correctFirstTriesArray.removeAll()
    for (scene, _) in numCorrectPerScene {
        numCorrectPerScene[scene] = 0
    }
    for (scene, _) in numIncorrectPerScene {
        numIncorrectPerScene[scene] = 0
    }
    for (scene, _) in accuracyPerScene {
        accuracyPerScene[scene] = 0
    }
}
