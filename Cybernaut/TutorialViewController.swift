//
//  TutorialViewController.swift
//  Cybernaut
//
//  Created by Kanchan Naik on 5/9/24.
//  Copyright © 2024 Jonathan Yang. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class TutorialViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "TutorialScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

class TutorialScene: SKScene {
    // Define your arrow_button node
    var arrowButton: SKNode?

    override func didMove(to view: SKView) {
           // Find the arrow_button node by its name
           arrowButton = childNode(withName: "//Overlay/next_button")
           
           // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
       
       @objc func handleTap(_ sender: UITapGestureRecognizer) {
           arrowButton?.isUserInteractionEnabled = true
           // Get the location of the tap in the scene
           let location = sender.location(in: sender.view)
           // Check if the tap is on the arrow_button
           if let nodeTapped = nodes(at: location).first {
               if nodeTapped == arrowButton { // Check if the tapped node is your arrow_button
                   print("arrowbutton recognized")
                   // Transition to the new scene
                       if let scene = SKScene(fileNamed: "TutorialScene_2") {
                           // Set the scale mode to scale to fit the window
                           scene.scaleMode = .aspectFill
                           // Present the scene
                           view?.presentScene(scene)
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

class TutorialScene_2: SKScene {
    // Define your arrow_button node
    var arrowButton: SKNode?

    override func didMove(to view: SKView) {
           // Find the arrow_button node by its name
           arrowButton = childNode(withName: "//Overlay/next_button")
           
           // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
       
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        arrowButton?.isUserInteractionEnabled = true
        // Get the location of the tap in the scene
        let location = sender.location(in: sender.view)
        // Check if the tap is on the arrow_button
        if let nodeTapped = nodes(at: location).first {
            if nodeTapped == arrowButton { // Check if the tapped node is your arrow_button
                print("arrowbutton recognized")
                // Transition to the new scene
                    if let scene = SKScene(fileNamed: "TutorialScene_3") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        // Present the scene
                        view?.presentScene(scene)
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

class TutorialScene_3: SKScene {
    // Define your arrow_button node
    var arrowButton: SKNode?

    override func didMove(to view: SKView) {
           // Find the arrow_button node by its name
           arrowButton = childNode(withName: "//Overlay/next_button")
           
           // Add tap gesture recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
               view.addGestureRecognizer(tapGestureRecognizer)
        view.isUserInteractionEnabled = true
    }
       
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        arrowButton?.isUserInteractionEnabled = true
        // Get the location of the tap in the scene
        let location = sender.location(in: sender.view)
        // Check if the tap is on the arrow_button
        if let nodeTapped = nodes(at: location).first {
            if nodeTapped == arrowButton { // Check if the tapped node is your arrow_button
                print("arrowbutton recognized")
                // Transition to the new scene
                    if let scene = SKScene(fileNamed: "TutorialScene_4") {
                        // Set the scale mode to scale to fit the window
                        scene.scaleMode = .aspectFill
                        // Present the scene
                        view?.presentScene(scene)
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

class TutorialScene_4: SKScene {
    override func sceneDidLoad() {
        super.sceneDidLoad()
        // Set the scale mode to resize the scene according to the view
        self.scaleMode = .aspectFit
    }
    
}
