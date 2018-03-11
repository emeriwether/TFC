//
//  ScoreScene2.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class ScoreScene2: SKScene {

    let listCorrectFTLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
    let numCorrectPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let numIncorrectPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")
    let accuracyPerSceneLabel = SKLabelNode(fontNamed: "Montserrat-Regular")

    override func didMove(to view: SKView) {

    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE COMPLETED LABELS
        for (scene, correct) in numCorrectPerScene {
            checkOrX_completed (scene: self, dictWord: scene, word: "rock", correct: correct, xCoord: -259.663, yCoord: 207.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "lamp", correct: correct, xCoord: -259.663, yCoord: 172.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "cat", correct: correct, xCoord: -259.663, yCoord: 137.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "lion", correct: correct, xCoord: -259.663, yCoord: 102.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "hand", correct: correct, xCoord: -259.663, yCoord: 67.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "rain", correct: correct, xCoord: -259.663, yCoord: 32.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "duck", correct: correct, xCoord: -259.663, yCoord: -7.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "moon", correct: correct, xCoord: -259.663, yCoord: -42.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "cow", correct: correct, xCoord: -259.663, yCoord: -77.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "trash", correct: correct, xCoord: -259.663, yCoord: -112.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "airplane", correct: correct, xCoord: -259.663, yCoord: -147.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "shoes", correct: correct, xCoord: -259.663, yCoord: -182.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "cake", correct: correct, xCoord: -259.663, yCoord: -219.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "stroller", correct: correct, xCoord: -259.663, yCoord: -254.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "toast", correct: correct, xCoord: -259.663, yCoord: -289.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "hat", correct: correct, xCoord: -259.663, yCoord: -324.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "cookie", correct: correct, xCoord: -259.663, yCoord: -359.489)
            checkOrX_completed (scene: self, dictWord: scene, word: "mouse", correct: correct, xCoord: -259.663, yCoord: -394.489)
        }
        for (scene, firstTry) in correctFirstTries {
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rock", firstTrt: firstTry, xCoord: 197.198, yCoord: 207.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lamp", firstTrt: firstTry, xCoord: 197.198, yCoord: 172.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cat", firstTrt: firstTry, xCoord: 197.198, yCoord: 137.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lion", firstTrt: firstTry, xCoord: 197.198, yCoord: 102.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hand", firstTrt: firstTry, xCoord: 197.198, yCoord: 67.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rain", firstTrt: firstTry, xCoord: 197.198, yCoord: 32.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "duck", firstTrt: firstTry, xCoord: 197.198, yCoord: -7.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "moon", firstTrt: firstTry, xCoord: 197.198, yCoord: -42.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cow", firstTrt: firstTry, xCoord: 197.198, yCoord: -77.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "trash", firstTrt: firstTry, xCoord: 197.198, yCoord: -112.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "airplane", firstTrt: firstTry, xCoord: 197.198, yCoord: -147.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "shoes", firstTrt: firstTry, xCoord: 197.198, yCoord: -182.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cake", firstTrt: firstTry, xCoord: 197.198, yCoord: -219.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "stroller", firstTrt: firstTry, xCoord: 197.198, yCoord: -254.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "toast", firstTrt: firstTry, xCoord: 197.198, yCoord: -289.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hat", firstTrt: firstTry, xCoord: 197.198, yCoord: -324.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cookie", firstTrt: firstTry, xCoord: 197.198, yCoord: -359.489)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "mouse", firstTrt: firstTry, xCoord: 197.198, yCoord: -394.489)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for buttons
        let backButton = self.childNode(withName: "back")
        let nextButton = self.childNode(withName: "next")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if next button is touched
        if nextButton!.contains(touch.location(in:self)){
            print("next touched")
            transitionScene (currentScene: self, sceneString: "ScoreScene3", waitTime: 0, fadeTime: 0)
        }
        
        // if back button is touched
        if backButton!.contains(touch.location(in: self)) {
            print("back touched")
            resetAllGameStats_coloring()
            transitionScene (currentScene: self, sceneString: "ScoreScene", waitTime: 0, fadeTime: 0)
        }
    }
}

func checkOrX_completed (scene: SKScene, dictWord: String, word: String, correct: Int, xCoord: Double, yCoord: Double) {
    let checkMark = SKSpriteNode(imageNamed: "check")
    let xMark = SKSpriteNode(imageNamed: "incorrect")
    
    let copiedCheck = checkMark.copy() as! SKSpriteNode
    copiedCheck.setScale(0.25)
    let copiedX = xMark.copy() as! SKSpriteNode
    copiedX.setScale(0.25)

    if dictWord == word {
        if correct == 1 {
            copiedCheck.position = CGPoint(x: xCoord, y: yCoord)
            scene.addChild(copiedCheck)
        } else if correct == 0 {
            copiedX.position = CGPoint(x: xCoord, y: yCoord)
            scene.addChild(copiedX)
        }
    }
}

func checkOrX_firstTry (scene: SKScene, dictWord: String, word: String, firstTry: Bool, xCoord: Double, yCoord: Double) {
    let checkMark = SKSpriteNode(imageNamed: "check")
    let xMark = SKSpriteNode(imageNamed: "incorrect")
    
    let copiedCheck = checkMark.copy() as! SKSpriteNode
    copiedCheck.setScale(0.25)
    let copiedX = xMark.copy() as! SKSpriteNode
    copiedX.setScale(0.25)
    
    if dictWord == word {
        if firstTry == true {
            copiedCheck.position = CGPoint(x: xCoord, y: yCoord)
            scene.addChild(copiedCheck)
        } else if firstTry == false {
            copiedX.position = CGPoint(x: xCoord, y: yCoord)
            scene.addChild(copiedX)
        }
    }
}
