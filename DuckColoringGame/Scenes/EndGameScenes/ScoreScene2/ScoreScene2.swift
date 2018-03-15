//
//  ScoreScene2.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class ScoreScene2: SKScene {

    override func didMove(to view: SKView) {
        
    ////////////////////////////////////////////////////////////////////////////////////////////
        let nameLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        let ageLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        
        // PLACE NAME & AGE LABELS
        printLabel (scene: self, label: nameLabel, words: "\(userName)", xCoord: -122.909, yCoord: -486.239, fontSize: 28)
        printLabel (scene: self, label: ageLabel, words: "\(userAge)", xCoord: 241, yCoord: -486.239, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE COMPLETED LABELS
        for (scene, correct) in numCorrectPerScene {
            checkOrX_completed (scene: self, dictWord: scene, word: "rock", correct: correct, xCoord: -259.663, yCoord: 226)//X
            checkOrX_completed (scene: self, dictWord: scene, word: "lamp", correct: correct, xCoord: -259.663, yCoord: 190)//X
            checkOrX_completed (scene: self, dictWord: scene, word: "duck", correct: correct, xCoord: -259.663, yCoord: 154)//X
            checkOrX_completed (scene: self, dictWord: scene, word: "moon", correct: correct, xCoord: -259.663, yCoord: 118)//X
            checkOrX_completed (scene: self, dictWord: scene, word: "cake", correct: correct, xCoord: -259.663, yCoord: 82)
            checkOrX_completed (scene: self, dictWord: scene, word: "stroller", correct: correct, xCoord: -259.663, yCoord: 46)
            checkOrX_completed (scene: self, dictWord: scene, word: "cat", correct: correct, xCoord: -259.663, yCoord: 10)
            checkOrX_completed (scene: self, dictWord: scene, word: "lion", correct: correct, xCoord: -259.663, yCoord: -26)
            checkOrX_completed (scene: self, dictWord: scene, word: "cow", correct: correct, xCoord: -259.663, yCoord: -62)
            checkOrX_completed (scene: self, dictWord: scene, word: "trash", correct: correct, xCoord: -259.663, yCoord: -98)
            checkOrX_completed (scene: self, dictWord: scene, word: "toast", correct: correct, xCoord: -259.663, yCoord: -134)
            checkOrX_completed (scene: self, dictWord: scene, word: "hat", correct: correct, xCoord: -259.663, yCoord: -170)
            checkOrX_completed (scene: self, dictWord: scene, word: "hand", correct: correct, xCoord: -259.663, yCoord: -211)
            checkOrX_completed (scene: self, dictWord: scene, word: "rain", correct: correct, xCoord: -259.663, yCoord: -247)
            checkOrX_completed (scene: self, dictWord: scene, word: "airplane", correct: correct, xCoord: -259.663, yCoord: -283)
            checkOrX_completed (scene: self, dictWord: scene, word: "shoes", correct: correct, xCoord: -259.663, yCoord: -319)
            checkOrX_completed (scene: self, dictWord: scene, word: "cookie", correct: correct, xCoord: -259.663, yCoord: -355)
            checkOrX_completed (scene: self, dictWord: scene, word: "mouse", correct: correct, xCoord: -259.663, yCoord: -391)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE INCORRECT-TOUCHES LABELS
        for (sceneString, numIncorrect) in numIncorrectPerScene {
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 218)//X
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lamp", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 183)//X
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "duck", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 146)//X
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "moon", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 109)//X
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cake", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 72)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "stroller", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 35)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -2)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lion", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -39)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cow", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -76)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "trash", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -113)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "toast", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -150)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -187)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hand", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -229)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rain", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -266)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "airplane", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -303)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "shoes", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -340)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cookie", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -377)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "mouse", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -414)
        }
        
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE FIRST-TRY LABELS

        for (scene, firstTry) in correctFirstTries {
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rock", firstTry: firstTry, xCoord: 197.198, yCoord: 226)//X
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lamp", firstTry: firstTry, xCoord: 197.198, yCoord: 190)//X
            checkOrX_firstTry (scene: self, dictWord: scene, word: "duck", firstTry: firstTry, xCoord: 197.198, yCoord: 154)//X
            checkOrX_firstTry (scene: self, dictWord: scene, word: "moon", firstTry: firstTry, xCoord: 197.198, yCoord: 118)//X
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cake", firstTry: firstTry, xCoord: 197.198, yCoord: 82)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "stroller", firstTry: firstTry, xCoord: 197.198, yCoord: 46)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cat", firstTry: firstTry, xCoord: 197.198, yCoord: 10)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lion", firstTry: firstTry, xCoord: 197.198, yCoord: -26)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cow", firstTry: firstTry, xCoord: 197.198, yCoord: -62)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "trash", firstTry: firstTry, xCoord: 197.198, yCoord: -98)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "toast", firstTry: firstTry, xCoord: 197.198, yCoord: -134)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hat", firstTry: firstTry, xCoord: 197.198, yCoord: -170)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hand", firstTry: firstTry, xCoord: 197.198, yCoord: -211)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rain", firstTry: firstTry, xCoord: 197.198, yCoord: -252)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "airplane", firstTry: firstTry, xCoord: 197.198, yCoord: -288)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "shoes", firstTry: firstTry, xCoord: 197.198, yCoord: -324)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cookie", firstTry: firstTry, xCoord: 197.198, yCoord: -359)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "mouse", firstTry: firstTry, xCoord: 197.198, yCoord: -396)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE ACCURACY LABELS
        for (scene, accuracy) in accuracyPerScene {
            accuracyLabels (scene: self, sceneString: scene, word: "rock", accuracy: accuracy, xCoord: 415.72, yCoord: 218)//X
            accuracyLabels (scene: self, sceneString: scene, word: "lamp", accuracy: accuracy, xCoord: 415.72, yCoord: 183)//X
            accuracyLabels (scene: self, sceneString: scene, word: "duck", accuracy: accuracy, xCoord: 415.72, yCoord: 146)//X
            accuracyLabels (scene: self, sceneString: scene, word: "moon", accuracy: accuracy, xCoord: 415.72, yCoord: 109)//X
            accuracyLabels (scene: self, sceneString: scene, word: "cake", accuracy: accuracy, xCoord: 415.72, yCoord: 72)
            accuracyLabels (scene: self, sceneString: scene, word: "stroller", accuracy: accuracy, xCoord: 415.72, yCoord: 35)
            accuracyLabels (scene: self, sceneString: scene, word: "cat", accuracy: accuracy, xCoord: 415.72, yCoord: -2)
            accuracyLabels (scene: self, sceneString: scene, word: "lion", accuracy: accuracy, xCoord: 415.72, yCoord: -39)
            accuracyLabels (scene: self, sceneString: scene, word: "cow", accuracy: accuracy, xCoord: 415.72, yCoord: -76)
            accuracyLabels (scene: self, sceneString: scene, word: "trash", accuracy: accuracy, xCoord: 415.72, yCoord: -113)
            accuracyLabels (scene: self, sceneString: scene, word: "toast", accuracy: accuracy, xCoord: 415.72, yCoord: -150)
            accuracyLabels (scene: self, sceneString: scene, word: "hat", accuracy: accuracy, xCoord: 415.72, yCoord: -187)
            accuracyLabels (scene: self, sceneString: scene, word: "hand", accuracy: accuracy, xCoord: 415.72, yCoord: -229)
            accuracyLabels (scene: self, sceneString: scene, word: "rain", accuracy: accuracy, xCoord: 415.72, yCoord: -266)
            accuracyLabels (scene: self, sceneString: scene, word: "airplane", accuracy: accuracy, xCoord: 415.72, yCoord: -303)
            accuracyLabels (scene: self, sceneString: scene, word: "shoes", accuracy: accuracy, xCoord: 415.72, yCoord: -340)
            accuracyLabels (scene: self, sceneString: scene, word: "cookie", accuracy: accuracy, xCoord: 415.72, yCoord: -377)
            accuracyLabels (scene: self, sceneString: scene, word: "mouse", accuracy: accuracy, xCoord: 415.72, yCoord: -414)
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
            transitionScene (currentScene: self, sceneString: "ScoreScene", waitTime: 0, fadeTime: 0)
        }
    }
}
