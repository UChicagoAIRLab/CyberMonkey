import SpriteKit

class EndGameScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        // Game Over
        let lblGameOver = SKLabelNode(fontNamed: "PixelDigivolve")
        lblGameOver.fontSize = 200
        lblGameOver.fontColor = SKColor.white
        lblGameOver.position = CGPoint(x: self.size.width / 2, y: self.size.height * 5/6)
        lblGameOver.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblGameOver.text = "Game Over"
        addChild(lblGameOver)
        
        
        let lblCorrectAnswer = SKLabelNode(fontNamed: "PixelDigivolve")
        lblCorrectAnswer.fontSize = 60
        lblCorrectAnswer.fontColor = SKColor.yellow
        lblCorrectAnswer.position = CGPoint(x: self.size.width / 2, y: self.size.height * 2/3)
        lblCorrectAnswer.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblCorrectAnswer.numberOfLines = 0 // Allow multiple lines
        lblCorrectAnswer.preferredMaxLayoutWidth = self.size.width * 5/6
        print(GameState.sharedInstance.correctAnswer)
        lblCorrectAnswer.text = String(format: "The correct answer is: \n %@", GameState.sharedInstance.correctAnswer)
        
        addChild(lblCorrectAnswer)
    
        
        // Score
        let lblScore = SKLabelNode(fontNamed: "PixelDigivolve")
        lblScore.fontSize = 200
        lblScore.fontColor = SKColor.white
        lblScore.position = CGPoint(x: self.size.width / 2, y: self.size.height/2 - 50)
        lblScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblScore.text = String(format: "%d", GameState.sharedInstance.score)
        addChild(lblScore)
        
        // High Score
        let lblHighScore = SKLabelNode(fontNamed: "PixelDigivolve")
        lblHighScore.fontSize = 120
        lblHighScore.fontColor = SKColor.cyan
        lblHighScore.position = CGPoint(x: self.size.width / 2, y: self.size.height/3)
        lblHighScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblHighScore.text = String(format: "High Score: %d", GameState.sharedInstance.highScore)
        addChild(lblHighScore)
        
        // Try again
        let lblTryAgain = SKLabelNode(fontNamed: "PixelDigivolve")
        lblTryAgain.fontSize = 120
        lblTryAgain.fontColor = SKColor.white
        lblTryAgain.position = CGPoint(x: self.size.width / 2, y: self.size.height/4)
        lblTryAgain.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        lblTryAgain.text = "Tap To Try Again"
        addChild(lblTryAgain)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Restart the game
        let gameScene = GameScene(fileNamed:"GameScene")
        gameScene!.scaleMode = .aspectFill
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        self.view?.presentScene(gameScene!, transition: reveal)

    }
}

