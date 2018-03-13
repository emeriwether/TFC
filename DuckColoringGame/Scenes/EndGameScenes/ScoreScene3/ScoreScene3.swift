//
//  ScoreScene3.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class ScoreScene3: SKScene {
    
    override func didMove(to view: SKView) {
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE COMPLETED LABELS
        for (scene, firstTry) in correctFirstTries {
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rock", firstTry: firstTry, xCoord: 197.198, yCoord: 207.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lamp", firstTry: firstTry, xCoord: 197.198, yCoord: 172.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cat", firstTry: firstTry, xCoord: 197.198, yCoord: 137.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lion", firstTry: firstTry, xCoord: 197.198, yCoord: 102.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hand", firstTry: firstTry, xCoord: 197.198, yCoord: 67.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rain", firstTry: firstTry, xCoord: 197.198, yCoord: 32.027)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "duck", firstTry: firstTry, xCoord: 197.198, yCoord: -7.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "moon", firstTry: firstTry, xCoord: 197.198, yCoord: -42.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cow", firstTry: firstTry, xCoord: 197.198, yCoord: -77.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "trash", firstTry: firstTry, xCoord: 197.198, yCoord: -112.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "airplane", firstTry: firstTry, xCoord: 197.198, yCoord: -147.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "shoes", firstTry: firstTry, xCoord: 197.198, yCoord: -182.411)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cake", firstTry: firstTry, xCoord: 197.198, yCoord: -219.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "stroller", firstTry: firstTry, xCoord: 197.198, yCoord: -254.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "toast", firstTry: firstTry, xCoord: 197.198, yCoord: -289.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hat", firstTry: firstTry, xCoord: 197.198, yCoord: -324.49)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cookie", firstTry: firstTry, xCoord: 197.198, yCoord: -359.489)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "mouse", firstTry: firstTry, xCoord: 197.198, yCoord: -394.489)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE INCORRECT-TOUCHES LABELS
        for (sceneString, numIncorrect) in numIncorrectPerScene {
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 207.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lamp", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 172.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 137.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lion", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 102.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hand", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 67.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rain", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 32.027)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "duck", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -7.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "moon", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -42.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cow", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -77.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "trash", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -112.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "airplane", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -147.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "shoes", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -182.411)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cake", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -219.49)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "stroller", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -254.49)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "toast", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -289.49)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -324.49)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cookie", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -359.489)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "mouse", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -394.489)
        }
        
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE FIRST-TRY LABELS
        for (scene, correct) in numCorrectPerScene {
            checkOrX_completed (scene: self, dictWord: scene, word: "rock", correct: correct, xCoord: -259.663, yCoord: 227.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "lamp", correct: correct, xCoord: -259.663, yCoord: 192.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "cat", correct: correct, xCoord: -259.663, yCoord: 157.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "lion", correct: correct, xCoord: -259.663, yCoord: 122.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "hand", correct: correct, xCoord: -259.663, yCoord: 87.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "rain", correct: correct, xCoord: -259.663, yCoord: 52.027)
            checkOrX_completed (scene: self, dictWord: scene, word: "duck", correct: correct, xCoord: -259.663, yCoord: 17.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "moon", correct: correct, xCoord: -259.663, yCoord: -22.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "cow", correct: correct, xCoord: -259.663, yCoord: -57.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "trash", correct: correct, xCoord: -259.663, yCoord: -92.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "airplane", correct: correct, xCoord: -259.663, yCoord: -127.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "shoes", correct: correct, xCoord: -259.663, yCoord: -162.411)
            checkOrX_completed (scene: self, dictWord: scene, word: "cake", correct: correct, xCoord: -259.663, yCoord: -199.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "stroller", correct: correct, xCoord: -259.663, yCoord: -234.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "toast", correct: correct, xCoord: -259.663, yCoord: -269.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "hat", correct: correct, xCoord: -259.663, yCoord: -304.49)
            checkOrX_completed (scene: self, dictWord: scene, word: "cookie", correct: correct, xCoord: -259.663, yCoord: -339.489)
            checkOrX_completed (scene: self, dictWord: scene, word: "mouse", correct: correct, xCoord: -259.663, yCoord: -374.489)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE ACCURACY LABELS
        for (scene, accuracy) in accuracyPerScene {
            accuracyLabels (scene: self, sceneString: scene, word: "rock", accuracy: accuracy, xCoord: 415.72, yCoord: 227.027)
            accuracyLabels (scene: self, sceneString: scene, word: "lamp", accuracy: accuracy, xCoord: 415.72, yCoord: 192.027)
            accuracyLabels (scene: self, sceneString: scene, word: "cat", accuracy: accuracy, xCoord: 415.72, yCoord: 157.027)
            accuracyLabels (scene: self, sceneString: scene, word: "lion", accuracy: accuracy, xCoord: 415.72, yCoord: 122.027)
            accuracyLabels (scene: self, sceneString: scene, word: "hand", accuracy: accuracy, xCoord: 415.72, yCoord: 87.027)
            accuracyLabels (scene: self, sceneString: scene, word: "rain", accuracy: accuracy, xCoord: 415.72, yCoord: 52.027)
            accuracyLabels (scene: self, sceneString: scene, word: "duck", accuracy: accuracy, xCoord: 415.72, yCoord: 17.411)
            accuracyLabels (scene: self, sceneString: scene, word: "moon", accuracy: accuracy, xCoord: 415.72, yCoord: -22.411)
            accuracyLabels (scene: self, sceneString: scene, word: "cow", accuracy: accuracy, xCoord: 415.72, yCoord: -57.411)
            accuracyLabels (scene: self, sceneString: scene, word: "trash", accuracy: accuracy, xCoord: 415.72, yCoord: -92.411)
            accuracyLabels (scene: self, sceneString: scene, word: "airplane", accuracy: accuracy, xCoord: 415.72, yCoord: -127.411)
            accuracyLabels (scene: self, sceneString: scene, word: "shoes", accuracy: accuracy, xCoord: 415.72, yCoord: -162.411)
            accuracyLabels (scene: self, sceneString: scene, word: "cake", accuracy: accuracy, xCoord: 415.72, yCoord: -199.49)
            accuracyLabels (scene: self, sceneString: scene, word: "stroller", accuracy: accuracy, xCoord: 415.72, yCoord: -234.49)
            accuracyLabels (scene: self, sceneString: scene, word: "toast", accuracy: accuracy, xCoord: 415.72, yCoord: -269.49)
            accuracyLabels (scene: self, sceneString: scene, word: "hat", accuracy: accuracy, xCoord: 415.72, yCoord: -304.49)
            accuracyLabels (scene: self, sceneString: scene, word: "cookie", accuracy: accuracy, xCoord: 415.72, yCoord: -339.489)
            accuracyLabels (scene: self, sceneString: scene, word: "mouse", accuracy: accuracy, xCoord: 415.72, yCoord: -374.489)
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
            transitionScene (currentScene: self, sceneString: "ScoreScene4", waitTime: 0, fadeTime: 0)
        }
        
        // if back button is touched
        if backButton!.contains(touch.location(in: self)) {
            transitionScene (currentScene: self, sceneString: "ScoreScene2", waitTime: 0, fadeTime: 0)
        }
    }
}
