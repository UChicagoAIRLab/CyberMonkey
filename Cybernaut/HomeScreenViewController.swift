//
//  HomeScreenViewController.swift
//  Cybernaut
//
//  Created by Jonathan Yang on 4/1/18.
//  Copyright © 2018 Jonathan Yang. All rights reserved.
//

import Foundation

import UIKit

class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func play(_ sender: UIButton) {
      if sender.title(for: .normal) == "PlayButton" {
        let gameViewController = self.storyboard!.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.present(gameViewController, animated: true)
      }
    }
    
    @IBAction func tutorial(_ sender: UIButton) {
      if sender.title(for: .normal) == "HowToButton" {
        let tutorialViewController = self.storyboard!.instantiateViewController(withIdentifier: "TutorialViewController") as! TutorialViewController
        self.present(tutorialViewController, animated: true)
      }
    }
    
    @IBAction func gameCenter(_ sender: UIButton) {
        GameKitHelper.sharedInstance.showGKGameCenterViewController(viewController: self)
    }
}
