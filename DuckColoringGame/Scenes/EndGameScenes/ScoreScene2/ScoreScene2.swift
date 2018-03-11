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
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE INCORRECT-TOUCHES LABELS
        for (sceneString, numIncorrect) in numIncorrectPerScene {
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lamp", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cat", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lion", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hand", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: , yCoord: )

        }
        
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE FIRST-TRY LABELS

        for (scene, firstTry) in correctFirstTries {
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rock", firstTry: firstTry, xCoord: 197.198, yCoord: 207.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lamp", firstTry: firstTry, xCoord: 197.198, yCoord: 172.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "duck", firstTry: firstTry, xCoord: 197.198, yCoord: 137.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "moon", firstTry: firstTry, xCoord: 197.198, yCoord: 102.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cake", firstTry: firstTry, xCoord: 197.198, yCoord: 67.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "stroller", firstTry: firstTry, xCoord: 197.198, yCoord: 32.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cat", firstTry: firstTry, xCoord: 197.198, yCoord: -7.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lion", firstTry: firstTry, xCoord: 197.198, yCoord: -42.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cow", firstTry: firstTry, xCoord: 197.198, yCoord: -77.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "trash", firstTry: firstTry, xCoord: 197.198, yCoord: -112.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "toast", firstTry: firstTry, xCoord: 197.198, yCoord: -147.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hat", firstTry: firstTry, xCoord: 197.198, yCoord: -182.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hand", firstTry: firstTry, xCoord: 197.198, yCoord: -219.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rain", firstTry: firstTry, xCoord: 197.198, yCoord: -254.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "airplane", firstTry: firstTry, xCoord: 197.198, yCoord: -289.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "shoes", firstTry: firstTry, xCoord: 197.198, yCoord: -324.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cookie", firstTry: firstTry, xCoord: 197.198, yCoord: -359.489)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "mouse", firstTry: firstTry, xCoord: 197.198, yCoord: -394.489)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE INCORRECT-TOUCHES LABELS
        
        
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

func incorrectTouchesLabels (scene: SKScene, sceneString: String, word: String, numIncorrect: Int, xCoord: Double, yCoord: Double) {
    let label = SKLabelNode(fontNamed:"Montserrat-SemiBold")
    let copiedLabel = label.copy() as! SKLabelNode
    let numIncorrect = String(numIncorrect)
    
    if sceneString == word {
        printLabel (scene: scene, label: copiedLabel, words: numIncorrect, xCoord: xCoord, yCoord: yCoord, fontSize: 28)
    }
}
