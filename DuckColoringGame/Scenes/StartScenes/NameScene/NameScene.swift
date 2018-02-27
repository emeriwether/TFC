//
//  NameScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class NameScene: SKScene, UITextFieldDelegate {
  
    var nameInput:UITextField?
    var noName:SKLabelNode?
    var noNameShowing = true
    
    var ageInput:UITextField?
    var noAge:SKLabelNode?
    var noAgeShowing = true
    
    override func didMove(to view: SKView) {
        nameInput = UITextField(frame: CGRect(x:45, y:175, width:635, height: 50))
        nameInput!.borderStyle = UITextBorderStyle.roundedRect
        nameInput!.backgroundColor = UIColor.lightGray
        nameInput!.placeholder = "Enter name here"
        nameInput!.textColor = UIColor.white
        nameInput!.clearButtonMode = .always
        nameInput!.adjustsFontSizeToFitWidth = true
        self.view?.addSubview(nameInput!)
        nameInput!.delegate = self
        
        ageInput = UITextField(frame: CGRect(x:45, y:465, width:635, height: 50))
        ageInput!.borderStyle = UITextBorderStyle.roundedRect
        ageInput!.backgroundColor = UIColor.lightGray
        ageInput!.placeholder = "Enter age here"
        ageInput!.textColor = UIColor.white
        ageInput!.clearButtonMode = .always
        ageInput!.adjustsFontSizeToFitWidth = true
        self.view?.addSubview(ageInput!)
        ageInput!.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameInput!.resignFirstResponder()
        ageInput!.resignFirstResponder()
        saveText()
        return true
    }
    
    func saveText() {
        if (nameInput!.text != "") {
            noNameShowing = false
            noName!.text = ""
        }
        if (ageInput!.text != "") {
            noAgeShowing = false
            noAge!.text = ""
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let okButton = childNode(withName: "ok")
        
        nameInput?.endEditing(true)
        ageInput?.endEditing(true)
        saveText()
        
        if (okButton!.contains(touch.location(in:self))) && (noNameShowing == false) && (noAgeShowing == false) {
            let startScene = SKScene(fileNamed: "StartScene")
            startScene?.scaleMode = SKSceneScaleMode.aspectFill
            let fade = SKTransition.fade(withDuration: 0.5)
            self.scene!.view?.presentScene(startScene!, transition: fade)
            nameInput?.removeFromSuperview()
            ageInput?.removeFromSuperview()
        } else if (okButton!.contains(touch.location(in:self))) && ((noNameShowing == true) || (noAgeShowing == true)) {
            
            if (noNameShowing == true) {
                noName = SKLabelNode(fontNamed: "Calibri")
                noName!.text = "Please enter a username."
                noName!.fontSize = 30
                noName!.fontColor = UIColor.red
                noName!.position = CGPoint (x:-600, y:180)
                noName!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
                self.addChild(noName!)
            }
            
            if (noAgeShowing == true) {
                noAge = SKLabelNode(fontNamed: "Calibri")
                noAge!.text = "Please enter an age for the user."
                noAge!.fontSize = 30
                noAge!.fontColor = UIColor.red
                noAge!.position = CGPoint (x:-600, y:-210)
                noAge!.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
                self.addChild(noAge!)
            }
        }
    }
}



