//
//  ScoreScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class PasswordScene: SKScene {
    
    var passwordInput:UITextField?
    
    override func didMove(to view: SKView) {
        passwordInput = UITextField(frame: CGRect(x:200, y:300, width:635, height: 50))
        passwordInput!.borderStyle = UITextBorderStyle.roundedRect
        passwordInput!.backgroundColor = UIColor.lightGray
        passwordInput!.placeholder = "Enter password here"
        passwordInput!.textColor = UIColor.white
        passwordInput!.clearButtonMode = .always
        passwordInput!.adjustsFontSizeToFitWidth = true
        self.view?.addSubview(passwordInput!)
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let okButton = childNode(withName: "ok")
        let cancelButton = childNode(withName: "cancel")
        
        passwordInput?.endEditing(true)
        print(passwordInput!.text)
        
        if okButton!.contains(touch.location(in:self)) {
            let scoreScene = SKScene(fileNamed: "ScoreScene")
            scoreScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(scoreScene!, transition: fade)
        }
        
        if cancelButton!.contains(touch.location(in: self)) {
            let allDoneScene = SKScene(fileNamed: "AllDoneScene")
            allDoneScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(allDoneScene!, transition: fade)
        }
    }
}


