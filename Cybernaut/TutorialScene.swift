//
//  TutorialScene.swift
//  Cybernaut
//
//  Created by Kanchan Naik on 5/9/24.
//  Copyright © 2024 Jonathan Yang. All rights reserved.
//

import SpriteKit
import CoreMotion
/*
class TutorialScene: SKScene {
    // Define your arrow_button node
    var arrowButton: SKNode?
    print("in TutorialScene")
    
    override func didMove(to view: SKView) {
        print("in the function")
           // Find the arrow_button node by its name
           arrowButton = childNode(withName: "arrow_button")
           print(arrowButton)
           
           // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               view.addGestureRecognizer(tapGestureRecognizer)
       }
       
       @objc func handleTap(_ sender: UITapGestureRecognizer) {
           // Get the location of the tap in the scene
           let location = sender.location(in: sender.view)
           
           // Check if the tap is on the arrow_button
           if let nodeTapped = nodes(at: location).first {
               if nodeTapped == arrowButton { // Check if the tapped node is your arrow_button
                   // Transition to the new scene
                   if let scene = TutorialScene2(fileNamed: "TutorialScene") {
                       scene.scaleMode = .aspectFill
                       if let skView = view {
                           skView.presentScene(scene)
                       }
                   }
               }
           }
       }

    override func sceneDidLoad() {
        super.sceneDidLoad()
        // Set the scale mode to resize the scene according to the view
        self.scaleMode = .aspectFit
      }

}

class TutorialScene2: SKScene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        // Set the scale mode to resize the scene according to the view
        self.scaleMode = .aspectFit
    }
}
*/
    
    
