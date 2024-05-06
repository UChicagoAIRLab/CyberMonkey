import SpriteKit
import CoreMotion

enum GameStatus: Int {
    case waitingForTap = 0
    case waitingForBomb = 1
    case playing = 2
    case gameOver = 3
    case paused = 4
}

enum PlayerStatus: Int {
    case idle = 0
    case jump = 1
    case fall = 2
    case dead = 3
}

struct PhysicsCategory {
    static let None: UInt32 = 0
    static let Player: UInt32 = 0b1 // 1
    static let PlatformNormal: UInt32 = 0b10 // 2
    static let PlatformBreakable: UInt32 = 0b100 // 4
    static let CoinNormal: UInt32 = 0b1000 // 8
    static let CoinSpecial: UInt32 = 0b10000  // 16
    static let Edges: UInt32 = 0b100000 // 32
    static let Monster: UInt32 = 0b1000000 // 64
}

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

protocol StackViewDelegate: class {
    func didTapOnView(at index: Int)
}

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class GameMenuView: UIStackView {
    weak var delegate: StackViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.distribution = .fillEqually
        self.alignment = .fill
        self.spacing = 10
        self.isUserInteractionEnabled = true
        //set up a label
        let instruct = UILabel()
        instruct.font = UIFont(name: "PixelDigivolve", size: 25)
        instruct.textColor = UIColor.white
        instruct.text = "Answer question for 2nd chance"
        instruct.textAlignment = .center
        instruct.adjustsFontSizeToFitWidth = true
        instruct.numberOfLines = 0
        self.addArrangedSubview(instruct)
        let prompt = UILabel()
        prompt.font = UIFont(name: "PixelDigivolve", size: 30)
        prompt.textColor = UIColor.white
        prompt.backgroundColor = hexStringToUIColor(hex: "1D2951")
        prompt.textAlignment = .center
        prompt.adjustsFontSizeToFitWidth = true
        prompt.numberOfLines = 0
        prompt.layer.masksToBounds = true
        prompt.layer.cornerRadius = 10.0
        self.addArrangedSubview(prompt)
        for i in 1...4 {
            let label = UILabel()
            label.font = UIFont(name: "PixelDigivolve", size: 25)
            label.textColor = UIColor.white
            label.backgroundColor = hexStringToUIColor(hex: "B53389")
            label.textAlignment = .center
            label.tag = i
            label.adjustsFontSizeToFitWidth = true
            label.numberOfLines = 0
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10.0
            self.addArrangedSubview(label)
        }
        let quit = UILabel()
        quit.font = UIFont(name: "PixelDigivolve", size: 20)
        quit.textColor = UIColor.white
        quit.text = "Skip"
        quit.textAlignment = .center
        quit.layer.cornerRadius = 10.0
        self.addArrangedSubview(quit)
        configureTapGestures()
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureTapGestures() {
        arrangedSubviews.forEach { view in
            view.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
            view.addGestureRecognizer(tapGesture)
        }
    }
    @objc func didTapOnView(_ gestureRecognizer: UIGestureRecognizer) {
        if let index = arrangedSubviews.index(of: gestureRecognizer.view!) {
            delegate?.didTapOnView(at: index)
        }
    }
}

class GameScene: SKScene, SKPhysicsContactDelegate, StackViewDelegate {
    
    var gameMenuView = GameMenuView()
    private var label : SKLabelNode?

    // MARK: - Properties
    var bgNode: SKNode!
    var fgNode: SKNode!
    var hudNode: SKNode!

    var backgroundOverlayTemplate: SKNode!
    var backgroundOverlayHeight: CGFloat!
    
    var player: SKSpriteNode!
    var platform5Across: SKSpriteNode!
    var platform2Across: SKSpriteNode!
    var platformArrow: SKSpriteNode!
    var platformDiagonal: SKSpriteNode!
    var break5Across: SKSpriteNode!
    var breakArrow: SKSpriteNode!
    var breakDiagonal: SKSpriteNode!
    var lava: SKSpriteNode!
    
    var coinPrivacy0: SKSpriteNode!
    var coinPrivacy1: SKSpriteNode!
    var coinPrivacy2: SKSpriteNode!
    
    var coinSocial0: SKSpriteNode!
    var coinSocial1: SKSpriteNode!
    var coinSocial2: SKSpriteNode!
    var coinSocial3: SKSpriteNode!
    
    var playerAnimationSteerLeft: SKAction!
    var playerAnimationSteerRight: SKAction!
    var currentPlayerAnimation: SKAction?
    
    let cameraNode = SKCameraNode()

    var lastOverlayPosition = CGPoint.zero
    var lastOverlayHeight: CGFloat = 0.0
    var levelPositionY: CGFloat = 0.0
    let motionManager = CMMotionManager()
    var xAcceleration: CGFloat = 0.0
    
    // Define initial state of enums
    var gameState = GameStatus.waitingForTap
    var playerState = PlayerStatus.idle
    
    // Labels for score
    var currentScore: SKLabelNode!
    var maxPlayerY: Int!
    private var hellolabel : SKLabelNode?
    
    var lastUpdateTimeInterval: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    var timeSinceLastExplosion: TimeInterval = 0
    var timeForNextExplosion: TimeInterval = 1.0
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var previousNumber: Int = 0
    var questionAnswered: Int = 0
    var selectedAnswer: Int = 0
    
    let allTFQuestions = TFQuestionBank()
    var TFQuestionNumber: Int = 0
    var TFPreviousNumber: Int = 0
    var TFQuestionAnswered: Int = 0
    var TFSelectedAnswer: Int = 0

    let gameGain: CGFloat = 2.5
    var redAlertTime: TimeInterval = 0
    
    // Label and Button Prompts for True/False Question
    var TFLabel: SKLabelNode!
    var TPrompt: SKSpriteNode!
    var FPrompt: SKSpriteNode!

    let soundBombDrop = SKAction.playSoundFileNamed("bombDrop.mp3", waitForCompletion: true)
    let soundStart = SKAction.playSoundFileNamed("start.caf", waitForCompletion: true)
    let soundExplodingPlatform = SKAction.playSoundFileNamed("exploding.mp3", waitForCompletion: true)
    let soundJump = SKAction.playSoundFileNamed("jump.caf", waitForCompletion: true)
    let soundBoost = SKAction.playSoundFileNamed("jetpack.mp3", waitForCompletion: true)
    let soundMonsterCrash = SKAction.playSoundFileNamed("monster-crash.mp3", waitForCompletion: true)
    let soundMonsterJump = SKAction.playSoundFileNamed("jumponmonster.mp3", waitForCompletion: true)
    let soundWin = SKAction.playSoundFileNamed("win.mp3", waitForCompletion: true)
    let soundFail = SKAction.playSoundFileNamed("pada.mp3", waitForCompletion: true)
    let soundCollect = SKAction.playSoundFileNamed("collect.mp3", waitForCompletion: true)
    
    let leaderboardIDMap = ["highest_score": "yangter23.Cybernaut23.highest_score"]
    
    override func didMove(to view: SKView) {
        playBackgroundMusic(name: "SpaceGame.mp3")
        playerAnimationSteerLeft = setupAnimationWithPrefix("astronaut_left_", start: 0, end: 0, timePerFrame: 0.1)
        playerAnimationSteerRight = setupAnimationWithPrefix("astronaut_right_", start: 0, end: 0, timePerFrame: 0.1)
        GameState.sharedInstance.score = 0
        self.hellolabel = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.hellolabel {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
        gameMenuView.delegate = self
        maxPlayerY = 1240 // The y of the starting position is 1240, so we don't want to automatically give 1240 points at the beginning
        setupCoreMotion()
        physicsWorld.contactDelegate = self
        setupNodes()
        setupLevel()
        setupPlayer()
        camera?.position = CGPoint(x: size.width/2, y: size.height/2)
    }
    
    // MARK: - Events
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if gameState == .waitingForTap {
            bombDrop()
        }
        
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "truePrompt" {
                if TFSelectedAnswer == 0 {
                    run(soundWin)
                    TFLabel.text = "Correct!"
                    TFLabel.fontColor = SKColor.green
                    self.TPrompt.isHidden = true
                    self.FPrompt.isHidden = true
                    TFLabel.run(
                        SKAction.sequence([
                            SKAction.wait(forDuration: 1.0),
                            SKAction.run {
                                self.TFLabel.isHidden = true
                                self.TFLabel.fontColor = SKColor.white
                            }
                            ])
                    )
                    boostPlayer()
                } else {
                    run(soundFail)
                    TFLabel.text = "Oops!" // add the answer to the question
                    TFLabel.fontColor = SKColor.red
                    self.TPrompt.isHidden = true
                    self.FPrompt.isHidden = true
                    TFLabel.run(
                        SKAction.sequence([
                            SKAction.wait(forDuration: 1.0),
                            SKAction.run {
                                self.TFLabel.isHidden = true
                                self.TFLabel.fontColor = SKColor.white
                            }
                            ])
                    )
                    let blast = explosion(intensity: 5.0)
                    blast.position = player.position
                    blast.zPosition = 11
                    addChild(blast)
                }
            }
            if name == "falsePrompt" {
                print("False Button")
                if TFSelectedAnswer == 1 {
                    run(soundWin)
                    TFLabel.text = "Correct!"
                    TFLabel.fontColor = SKColor.green
                    self.TPrompt.isHidden = true
                    self.FPrompt.isHidden = true
                    TFLabel.run(
                        SKAction.sequence([
                            SKAction.wait(forDuration: 1.0),
                            SKAction.run {
                                self.TFLabel.isHidden = true
                                self.TFLabel.fontColor = SKColor.white
                            }
                            ])
                    )
                    boostPlayer()
                }
                else {
                    run(soundFail)
                    TFLabel.text = "Oops!"
                    TFLabel.fontColor = SKColor.red
                    self.TPrompt.isHidden = true
                    self.FPrompt.isHidden = true
                    TFLabel.run(
                        SKAction.sequence([
                            SKAction.wait(forDuration: 1.0),
                            SKAction.run {
                                self.TFLabel.isHidden = true
                                self.TFLabel.fontColor = SKColor.white
                            }
                            ])
                    )
                }
            }
        }
    }

    func didBegin(_ contact: SKPhysicsContact) {
        let other = contact.bodyA.categoryBitMask == PhysicsCategory.Player ? contact.bodyB : contact.bodyA
        switch other.categoryBitMask {
        case PhysicsCategory.CoinNormal:
            if let coin = other.node as? SKSpriteNode {
                // Collision with powerup
                collideWithCoin(true)
                run(soundCollect)
                coin.removeFromParent()
            }
        case PhysicsCategory.CoinSpecial:
            if let coin = other.node as? SKSpriteNode {
                collideWithCoin(false)
                run(soundCollect)
                coin.removeFromParent()
            }
        case PhysicsCategory.PlatformNormal:
            if let platform = other.node as? SKSpriteNode {
                if player.physicsBody!.velocity.dy < 0 {
                    run(soundJump)
                    platformAction(platform, breakable: false)
                }
            }
        case PhysicsCategory.PlatformBreakable:
            if let platform = other.node as? SKSpriteNode {
                if player.physicsBody!.velocity.dy < 0 {
                    run(soundExplodingPlatform)
                    platformAction(platform, breakable: true)
                }
            }
        case PhysicsCategory.Monster:
            if let monster = other.node as? SKSpriteNode {
                if player.physicsBody!.velocity.dy < 0 {
                    run(soundMonsterJump)
                    jumpPlayer()
                    monster.removeFromParent()
                }
                else {
                    run(soundMonsterCrash)
                    monster.removeFromParent()
                    setupSecondChanceQuiz()
                }
            }
        default: break
        }
    }
    
    func screenShakeByAmt(_ amt: CGFloat) {
        // 1
        let worldNode = childNode(withName: "World")!
        worldNode.position = CGPoint(x: size.width / 2.0, y:
            size.height / 2.0)
        worldNode.removeAction(forKey: "shake")
        // 2
        let amount = CGPoint(x: 0, y: -(amt * gameGain))
        // 3
        let action = SKAction.screenShakeWithNode(worldNode, amount:
            amount, oscillations: 10, duration: 2.0)
        // 4
        worldNode.run(action, withKey: "shake")
    }
    
    func spawnEnemy() {
        let enemy = SKSpriteNode(imageNamed: "alien_side_green")
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.categoryBitMask = PhysicsCategory.Monster
        enemy.physicsBody?.contactTestBitMask = PhysicsCategory.Player
        enemy.physicsBody?.collisionBitMask = 0
        enemy.position = CGPoint(x: player.position.x + size.width/2, y: player.position.y + self.size.height / 2)
        fgNode.addChild(enemy)
        let actionMidMove = SKAction.move(
            to: CGPoint(x: -enemy.size.width, y: enemy.position.y),
            duration: 2.0)
        let actionMove = SKAction.move(
            to: CGPoint(x: enemy.size.width, y: enemy.position.y),
            duration: 2.0)
        let sequence = SKAction.sequence([actionMidMove, actionMove])
        let repeatAction = SKAction.repeatForever(sequence)
        enemy.run(repeatAction)
    }
    
    func collideWithCoin(_ typePrivacy: Bool) {
        updateTFQuestion(typePrivacy)
    }
    
    func updateTFQuestion(_ typePrivacy: Bool) {
        var score = 0
        /* Parse text in the currentScore */
        if let text = currentScore.text {
            score = Int(text)!
        }
                
        var availableQuestions: [TFQuestion]
        if (score < 200000)
        {
            availableQuestions = allTFQuestions.list.filter { (question: TFQuestion) -> Bool in
                return !question.is_hard
            }
            } else {
                availableQuestions = allTFQuestions.list.filter { (question: TFQuestion) -> Bool in
                return question.is_hard
            }
        }
        TFQuestionNumber = Int(arc4random_uniform(UInt32(availableQuestions.count)))
        if typePrivacy == true {
            while availableQuestions[TFQuestionNumber].type != "privacy" {
                TFQuestionNumber = Int(arc4random_uniform(UInt32(availableQuestions.count)))
            }
                TFLabel.text = availableQuestions[TFQuestionNumber].question
                TFSelectedAnswer = availableQuestions[TFQuestionNumber].correctAnswer
                setTFLabel()
                setTFPowerups()
                
        }
        
        else {
            while availableQuestions[TFQuestionNumber].type == "privacy" {
                TFQuestionNumber = Int(arc4random_uniform(UInt32(availableQuestions.count)))
            }
            TFLabel.text = availableQuestions[TFQuestionNumber].question
            TFSelectedAnswer = availableQuestions[TFQuestionNumber].correctAnswer
            setTFLabel()
            setTFPowerups()
        }
        
        if TFQuestionAnswered < availableQuestions.count {
            // Prevents (consecutive) repeating questions.
            while TFPreviousNumber == TFQuestionNumber {
                TFQuestionNumber = Int(arc4random_uniform(UInt32(availableQuestions.count)))
            }
            TFPreviousNumber = TFQuestionNumber
            TFQuestionAnswered += 1
        }
    }

    func setTFLabel() { // Put argument for the string from the question
        guard let view = self.view else {
            return
        }
        
        TFLabel = hudNode.childNode(withName: "TFLabel") as! SKLabelNode
        TFLabel.isHidden = false
        TFLabel.numberOfLines = 0
        TFLabel.preferredMaxLayoutWidth = view.bounds.size.width
        TFLabel.text = allTFQuestions.list[TFQuestionNumber].question
        TFLabel.run(
            SKAction.sequence([
                SKAction.wait(forDuration: 10.0),
                SKAction.run {
                    self.TFLabel.isHidden = true
                }
                ])
        )
    }
    
    func updateTFLabel() {
        TFLabel.position.x = player.position.x
        TFLabel.position.y = player.position.y - (size.height / 8)
    }
    
    func setTFPowerups() {
        TPrompt.isHidden = false
        FPrompt.isHidden = false
        TFLabel.run(
            SKAction.sequence([
                SKAction.wait(forDuration: 10.0),
                SKAction.run {
                    self.TPrompt.isHidden = true
                    self.FPrompt.isHidden = true
                }
                ])
        )
    }
    
    func updateTFPowerups() {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        TPrompt.position = CGPoint(x: player.position.x - screenWidth * 1/3,
                                   y: player.position.y - screenHeight * 2/3)
        FPrompt.position = CGPoint(x: player.position.x + screenWidth * 1/3,
                                   y: player.position.y - screenHeight * 2/3)
    }
    
    func createForegroundOverlay(_ overlayTemplate:
        SKSpriteNode, flipX: Bool) {
        let foregroundOverlay = overlayTemplate.copy() as! SKSpriteNode
        lastOverlayPosition.y = lastOverlayPosition.y +
            (lastOverlayHeight + (foregroundOverlay.size.height / 2.0))
        lastOverlayHeight = foregroundOverlay.size.height / 2.0
        foregroundOverlay.position = lastOverlayPosition
        if flipX == true {
            foregroundOverlay.xScale = -1.0
        }
        foregroundOverlay.zPosition = 1
        fgNode.addChild(foregroundOverlay)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // 1
        if lastUpdateTimeInterval > 0 {
            deltaTime = currentTime - lastUpdateTimeInterval
        } else {
            deltaTime = 0
        }
        lastUpdateTimeInterval = currentTime
        // 2
        if isPaused {
            return
        }
        // 3
        if gameState == .playing {
            updateCamera()
            updateScore()
            updateLevel()
            updatePlayer()
            updateTFLabel()
            updateTFPowerups()
            updateLava(deltaTime)
            updateExplosions(deltaTime)
            updateRedAlert(deltaTime)
        }

    }
    
    // Whenever a player gets hit by the lava
    func updateLava(_ dt: TimeInterval) {
        let bottomOfScreenY = camera!.position.y - (size.height / 2)
        let bottomOfScreenYFg = convert(CGPoint(x: 0, y: bottomOfScreenY), to: fgNode).y
        let lavaVelocityY = CGFloat(120)
        let lavaStep = lavaVelocityY * CGFloat(dt)
        var newLavaPositionY = lava.position.y + lavaStep / 2
        // 4
        newLavaPositionY = max(newLavaPositionY, (bottomOfScreenYFg - 125.0))
        // 5
        lava.position.y = newLavaPositionY
        if player.position.y < lava.position.y + 180 {
            run(soundMonsterCrash)
            jumpPlayer()
            run(SKAction.sequence([
                SKAction.wait(forDuration: 0.05),
                SKAction.run() {
                    self.setupSecondChanceQuiz()
                }
                ]))
        }
    }
    
    func updateExplosions(_ dt: TimeInterval) {
        timeSinceLastExplosion += dt
        if timeSinceLastExplosion > timeForNextExplosion {
            timeForNextExplosion = TimeInterval(CGFloat.random(min:0.1,
                                                               max: 0.5))
            timeSinceLastExplosion = 0
            createRandomExplosion()
        }
    }
    
    func updateLevel() {
        let cameraPos = camera!.position
        if cameraPos.y > levelPositionY - (size.height * 0.55) {
            addRandomCoinForegroundOverlay()
        }
        if cameraPos.y > levelPositionY - (size.height * 0.55) {
            createBackgroundOverlay()
            while lastOverlayPosition.y < levelPositionY {
                addRandomForegroundOverlay()
            }
        }
        
        // remove old foreground nodes...
        for fgChild in fgNode.children {
            let nodePos = fgNode.convert(fgChild.position, to: self)
            if !isNodeVisible(fgChild, positionY: nodePos.y) {
                fgChild.removeFromParent()
            }
        }
    }
    
    // Updates value and position of score label
    func updateScore() {
        guard let view = self.view else {
            return
        }
        let screenHeight = view.bounds.size.height
        let bottomOfScreenY = camera!.position.y - (size.height / 2)
        currentScore.position.y = bottomOfScreenY + screenHeight - (screenHeight / 10)
        currentScore.text = String(format: "%d", GameState.sharedInstance.score)
        if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
            currentScore.run(SKAction.scale(to: 1.5, duration: 0.25))
            currentScore.fontColor = SKColor(red:0.99, green:0.92, blue:0.55, alpha:1.0)
        }
    }
    
    func updateCamera() {
        // 1
        let cameraTarget = convert(player.position,
                                   from: fgNode)
        // 2
        var targetPositionY = cameraTarget.y - (size.height * 0.10)
        let lavaPos = convert(lava.position, from: fgNode)
        targetPositionY = max(targetPositionY, lavaPos.y)
        // 3
        let diff = targetPositionY - camera!.position.y
        // 4
        let cameraLagFactor = CGFloat(0.2)
        let lagDiff = diff * cameraLagFactor
        let newCameraPositionY = camera!.position.y + lagDiff
        // 5
        camera!.position.y = newCameraPositionY
        // Updates position of score
        
    }
    
    func updatePlayer() {
        // Set velocity based on core motion
        player.physicsBody?.velocity.dx = xAcceleration * 1000.0
        // Wrap player around edges of screen
        
        var playerPosition = convert(player.position, from: fgNode)
        let leftLimit = sceneCropAmount()/2 - player.size.width/2
        let rightLimit = size.width - sceneCropAmount()/2
            + player.size.width/2
        if playerPosition.x < leftLimit {
            playerPosition = convert(CGPoint(x: rightLimit, y: 0.0),
                                     to: fgNode)
            player.position.x = playerPosition.x
        }
        else if playerPosition.x > rightLimit {
            playerPosition = convert(CGPoint(x:
                leftLimit, y: 0.0), to: fgNode)
            player.position.x = playerPosition.x
        }
        
        
        // Updates the score based on if the player goes higher
        if Int(player.position.y) > maxPlayerY! {
            // 2
            GameState.sharedInstance.score += Int(player.position.y) - maxPlayerY!
            // 3
            maxPlayerY = Int(player.position.y)
            // 4
            currentScore.text = String(format: "%d", GameState.sharedInstance.score)
        }
        
        // Check player state
        if player.physicsBody!.velocity.dy < CGFloat(0.0) &&
            playerState != .fall {
            playerState = .fall
        } else if player.physicsBody!.velocity.dy > CGFloat(0.0) &&
            playerState != .jump {
            playerState = .jump
        }
      
        if abs(player.physicsBody!.velocity.dx) > 100.0 {
            if player.physicsBody!.velocity.dx > 0 {
                runPlayerAnimation(playerAnimationSteerRight)
            } else {
                runPlayerAnimation(playerAnimationSteerLeft)
                }
        }
        
    }
    
    func bombDrop() {
        gameState = .waitingForBomb
        // Scale out title & ready label.
        let scale = SKAction.scale(to: 0, duration: 0.4)
        fgNode.childNode(withName: "Title")!.run(scale)
        fgNode.childNode(withName: "Ready")!.run(
            SKAction.sequence(
                [SKAction.wait(forDuration: 0.2), scale]))
        
        // Bounce bomb
        let scaleUp = SKAction.scale(to: 1.25, duration: 0.25)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.25)
        let sequence = SKAction.sequence([scaleUp, scaleDown])
        let repeatSeq = SKAction.repeatForever(sequence)
        fgNode.childNode(withName: "Bomb")!.run(SKAction.unhide())
        fgNode.childNode(withName: "Bomb")!.run(repeatSeq)
        run(SKAction.sequence([
            soundStart,
            SKAction.wait(forDuration: 2.0),
            SKAction.run(startGame),
            soundBombDrop
        ]))
    }
    
    func startGame() {
        // Creates an explosion particle system. Then it places the explosion at the bomb’s position
        let bomb = fgNode.childNode(withName: "Bomb")!
        let bombBlast = explosion(intensity: 2.0)
        bombBlast.position = bomb.position
        fgNode.addChild(bombBlast) // adds the particle system to the scene and removes the bomb sprite.
        screenShakeByAmt(100)
        bomb.removeFromParent()
        gameState = .playing
        player.physicsBody!.isDynamic = true // Start the player by putting them into the physics simulation
        superBoostPlayer()  // Give the player node an initial upward impulse to get them started
    }
    
    func setupNodes() {
        let worldNode = childNode(withName: "World")!
        bgNode = worldNode.childNode(withName: "Background")!
        backgroundOverlayTemplate = bgNode.childNode(withName: "Overlay")!.copy() as! SKNode
        backgroundOverlayHeight = backgroundOverlayTemplate.calculateAccumulatedFrame().height
     
        fgNode = worldNode.childNode(withName: "Foreground")!
        player = fgNode.childNode(withName: "Player") as! SKSpriteNode
        fgNode.childNode(withName: "Bomb")?.run(SKAction.hide())
        
        platform5Across = loadForegroundOverlayTemplate("Platform5Across")
        platform2Across = loadForegroundOverlayTemplate("Platform2Across")
        platformArrow = loadForegroundOverlayTemplate("PlatformArrow")
        breakArrow = loadForegroundOverlayTemplate("BreakArrow")
        platformDiagonal = loadForegroundOverlayTemplate("PlatformDiagonal")
        breakDiagonal = loadForegroundOverlayTemplate("BreakDiagonal")
        break5Across = loadForegroundOverlayTemplate("Break5Across")
        coinSocial0 = loadCoin("Coin1")
        coinSocial1 = loadCoin("Coin2")
        coinSocial2 = loadCoin("Coin3")
        coinSocial3 = loadCoin("Coin4")
        coinPrivacy0 = loadCoin("Coin5")
        coinPrivacy1 = loadCoin("Coin6")
        coinPrivacy2 = loadCoin("Coin7")
        setupLava()
        
        hudNode = worldNode.childNode(withName: "Hud")
        currentScore = hudNode.childNode(withName: "ScoreLabel") as! SKLabelNode
        TFLabel = hudNode.childNode(withName: "TFLabel") as! SKLabelNode
        TFLabel.numberOfLines = 2
        TFLabel.isHidden = true
        TPrompt = hudNode.childNode(withName: "TruePrompt") as! SKSpriteNode
        TPrompt.name = "truePrompt"
        TPrompt.isHidden = true
        TPrompt.isUserInteractionEnabled = false
        FPrompt = hudNode.childNode(withName: "FalsePrompt") as! SKSpriteNode
        FPrompt.name = "falsePrompt"
        FPrompt.isUserInteractionEnabled = false
        FPrompt.isHidden = true
       
        addChild(cameraNode)
        camera = cameraNode
    }
    
   func setupSecondChanceQuiz() {
        // Menu setup with stackView
       guard let view = self.view else {
           return
       }
       

        let screenSize = UIScreen.main.bounds
        let scale = view.bounds.size.height / self.size.height
       /*
        let scale = view.bounds.size.height / self.size.height
        let scaledWidth = self.size.width * scale
        let scaledOverlap = scaledWidth - view.bounds.size.width
        */
       let screenWidth = view.bounds.size.width
        let screenHeight = screenSize.height
       gameMenuView.frame = CGRect(x: 0, y: 100, width: screenWidth, height: screenHeight * 0.5)

        self.view!.addSubview(gameMenuView)
        gameMenuView.delegate = self
        gameState = .paused
        physicsWorld.speed = 0
        updateQuestion()
    }
    
    func didTapOnView(at index: Int) {
        if index == selectedAnswer + 2 {
            run(soundWin)
            let subView = self.gameMenuView.arrangedSubviews[index]
            let bounds = subView.bounds
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                subView.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            }, completion: { (success:Bool) in
                if success {
                    UIView.animate(withDuration: 0.5, animations: {
                        let smokeTrail = self.addTrail(name: "SmokeTrail")
                        self.run(SKAction.sequence([
                            SKAction.wait(forDuration: 3.0),
                            SKAction.run() {
                                self.removeTrail(trail: smokeTrail)
                            }
                            ]))
                        self.boostPlayer()
                        self.screenShakeByAmt(50)
                        self.gameState = .playing
                        self.physicsWorld.speed = 1
                        self.gameMenuView.removeFromSuperview()
                    })
                }
            })
           
        }
        else {
           gameOver()
        }
    }
    
    func updateQuestion() {
        var score = 0
        /* Parse text in the currentScore */
        if let text = currentScore.text {
            score = Int(text)!
        }
        
        var availableQuestions: [Question]
        if (score < 200000)
        {
            availableQuestions = allQuestions.list.filter { (question: Question) -> Bool in
                return !question.is_hard
            }
        } else {
            availableQuestions = allQuestions.list.filter { (question: Question) -> Bool in
                return question.is_hard
            }
        }
        
        if availableQuestions.isEmpty {
            print("Error: No available questions")
        } else {
            let questionNumber = Int(arc4random_uniform(UInt32(availableQuestions.count)))
            let selectedQuestion = availableQuestions[questionNumber]
            
            let prompt = gameMenuView.subviews[1] as! UILabel
            prompt.text = "" + selectedQuestion.question
            
            let optionA = gameMenuView.subviews[2] as! UILabel
            optionA.text = "" + selectedQuestion.optionA
            
            let optionB = gameMenuView.subviews[3] as! UILabel
            optionB.text = "" + selectedQuestion.optionB
            
            let optionC = gameMenuView.subviews[4] as! UILabel
            optionC.text = "" + selectedQuestion.optionC
            
            let optionD = gameMenuView.subviews[5] as! UILabel
            optionD.text = "" + selectedQuestion.optionD
            
            selectedAnswer = selectedQuestion.correctAnswer
            
            if selectedAnswer == 0 {
                GameState.sharedInstance.correctAnswer = selectedQuestion.optionA
            } else if selectedAnswer == 1 {
                GameState.sharedInstance.correctAnswer = selectedQuestion.optionB
            } else if selectedAnswer == 2 {
                GameState.sharedInstance.correctAnswer = selectedQuestion.optionC
            } else if selectedAnswer == 3 {
                GameState.sharedInstance.correctAnswer = selectedQuestion.optionD
            }
            
        }
        if questionAnswered < availableQuestions.count {
            // Prevents repeating questions.
            while previousNumber == questionNumber {
                questionNumber =  Int(arc4random_uniform(UInt32(availableQuestions.count)))
            }
            previousNumber = questionNumber
            questionAnswered += 1
        }
    }
    
    func setupLevel() {
        // Place initial platform
        let initialPlatform = platform5Across.copy() as! SKSpriteNode
        var overlayPosition = player.position
        overlayPosition.y = player.position.y -
            ((player.size.height * 0.5) +
                (initialPlatform.size.height * 0.20))
        initialPlatform.position = overlayPosition
        fgNode.addChild(initialPlatform)
        lastOverlayPosition = overlayPosition
        lastOverlayHeight = initialPlatform.size.height / 2.0
        
        // Create random level
        levelPositionY = bgNode.childNode(withName: "Overlay")!
            .position.y + backgroundOverlayHeight
        while lastOverlayPosition.y < levelPositionY {
            addRandomForegroundOverlay()
        }
    }
    
    func setupPlayer() {
        player.physicsBody = SKPhysicsBody(circleOfRadius:
            player.size.width * 0.3)
        player.physicsBody!.isDynamic = false
        player.physicsBody!.allowsRotation = false
        player.physicsBody!.categoryBitMask = PhysicsCategory.Player
        player.physicsBody!.collisionBitMask = PhysicsCategory.None
    }
    
    func setupCoreMotion() {
        motionManager.accelerometerUpdateInterval = 0.2
        let queue = OperationQueue()
        motionManager.startAccelerometerUpdates(to: queue,
                                                withHandler:
            {
                accelerometerData, error in
                guard let accelerometerData = accelerometerData else {
                    return
                }
                let acceleration = accelerometerData.acceleration
                self.xAcceleration = (CGFloat(acceleration.x) * 2.4) +
                    (self.xAcceleration * 0.25)
        })
    }
    
    func setupLava() {
        lava = fgNode.childNode(withName: "Lava") as! SKSpriteNode
        let emitter = SKEmitterNode(fileNamed: "Lava.sks")!
        emitter.particlePositionRange = CGVector(dx: size.width * 1.125, dy: 0.0)
        emitter.advanceSimulationTime(1.5)
        lava.addChild(emitter)
    }
    
    // Create method for collision with the ground
    func gameOver() {
        // 1
        gameState = .gameOver
        playerState = .dead
        // 2
        run(soundFail)
        physicsWorld.contactDelegate = nil
        player.physicsBody?.isDynamic = false
        // 3
        let moveUp = SKAction.moveBy(x: 0.0, y: size.height/2.0,
                                     duration: 0.5)
        moveUp.timingMode = .easeOut
        let moveDown = SKAction.moveBy(x: 0.0,
                                       y: -(size.height * 1.5),
                                       duration: 1.0)
        moveDown.timingMode = .easeIn
        player.run(SKAction.sequence([moveUp, moveDown]))
        
        // We want to save the score/high score we have
        GameState.sharedInstance.saveState()
        reportScoreToGameCenter(score: Int64(GameState.sharedInstance.score))
        gameMenuView.removeFromSuperview()
        let blast = explosion(intensity: 5.0)
        blast.position = player.position
        blast.zPosition = 11
        addChild(blast)
        
        run(SKAction.sequence([
            SKAction.wait(forDuration: 1),
            SKAction.run() {
                let reveal = SKTransition.doorsCloseHorizontal(withDuration: 2)
                let endGameScene = EndGameScene(size: self.size)
                self.view!.presentScene(endGameScene, transition: reveal)
            }
            ]))
    }
    
    func reportScoreToGameCenter(score: Int64) {
        GameKitHelper.sharedInstance.reportScore(score: score, forLeaderboardID: leaderboardIDMap["highest_score"]!)
    }
    
    func sceneCropAmount() -> CGFloat {
        guard let view = self.view else {
            return 0
        }
        let scale = view.bounds.size.height / self.size.height
        let scaledWidth = self.size.width * scale
        let scaledOverlap = scaledWidth - view.bounds.size.width
        return scaledOverlap / scale
    }
    
    func setPlayerVelocity(_ amount:CGFloat) {
        player.physicsBody!.velocity.dy = max(player.physicsBody!.velocity.dy, amount * gameGain)
        
    }
    
    func jumpPlayer() {
        setPlayerVelocity(500)
    }
    
    func boostPlayer() {
        run(soundBoost)
        setPlayerVelocity(1200)
    }
    
    func superBoostPlayer() {
        setPlayerVelocity(1700)
    }
    
    func increaseScoreRegularPlatform() {
        GameState.sharedInstance.score += 20
    }
    
    func increaseScoreBreakPlatform() {
        GameState.sharedInstance.score += 40
    }
    
    func platformAction(_ sprite: SKSpriteNode, breakable: Bool) {
        let amount = CGPoint(x: 0, y: -75.0)
        /*let blueTrail = self.addTrail(name: "PlayerTrail")
        self.run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run() {
                self.removeTrail(trail: blueTrail)
            }
            ])) */
        let action = SKAction.screenShakeWithNode(sprite,
                                                  amount: amount, oscillations: 10, duration: 2.0)
        sprite.run(action)
        if breakable == true {
            sprite.removeFromParent()
        }
        jumpPlayer()
        increaseScoreRegularPlatform()
    }
    
    func addRandomCoinForegroundOverlay() {
        let randomCoin = Int(arc4random_uniform(100)+1)
        if randomCoin <= 50 {
            if TFLabel.isHidden {
                spawnEnemy()
                let randomSocial = Int(arc4random_uniform(4))
                if randomSocial == 0 {
                    createForegroundOverlay(coinSocial0, flipX: false)
                }
                if randomSocial == 1 {
                    createForegroundOverlay(coinSocial1, flipX: false)
                }
                if randomSocial == 2 {
                    createForegroundOverlay(coinSocial2, flipX: false)
                }
                if randomSocial == 3 {
                    createForegroundOverlay(coinSocial3, flipX: false)
                }
            }
        }
        if randomCoin > 50 {
            if TFLabel.isHidden {
                spawnEnemy()
                let randomPrivacy = Int(arc4random_uniform(3))
                if randomPrivacy == 0 {
                    createForegroundOverlay(coinPrivacy0, flipX: false)
                }
                if randomPrivacy == 1 {
                    createForegroundOverlay(coinPrivacy1, flipX: false)
                }
                if randomPrivacy == 2 {
                    createForegroundOverlay(coinPrivacy2, flipX: false)
                }
            }
        }
    }
    
    func addRandomForegroundOverlay() {
        let overlaySprite: SKSpriteNode!
        let platform5AcrossPercentage = 18
        let platform2AcrossPercentage = 35
        let platformArrowAPercentage = 53
        let platformDiagonalPercentage = 70
        let break5AcrossPercentage = 80
        let breakArrowPercentage = 90
        let random = Int(arc4random_uniform(100)+1)
        
        // Platform5Across
        if random <= platform5AcrossPercentage {
            overlaySprite = platform5Across
        }
        
        else if random <= platform2AcrossPercentage {
            overlaySprite = platform2Across
        }
        
        // PlatformArrow
        else if random <= platformArrowAPercentage {
            overlaySprite = platformArrow
        }
        
        // PlatformDiagonal
        else if random <= platformDiagonalPercentage {
            overlaySprite = platformDiagonal
        }
        
        else if random <= break5AcrossPercentage {
            overlaySprite = break5Across
        }
        // BreakArrow
        else if random <= breakArrowPercentage {
            overlaySprite = breakArrow
        }
        
        // BreakDiagonal
        else {
            overlaySprite = breakDiagonal
        }
        createForegroundOverlay(overlaySprite, flipX: false)
    }
    
    // MARK: - Overlay nodes
    // 1
    func loadForegroundOverlayTemplate(_ fileName: String) ->
        SKSpriteNode {
            let overlayScene = SKScene(fileNamed: fileName)!
            let overlayTemplate = overlayScene.childNode(withName: "Overlay")
            return overlayTemplate as! SKSpriteNode
    }
    
    // Loading the coin nodes
    func loadCoin(_ fileName: String) -> SKSpriteNode {
        let coinScene = SKScene(fileNamed: fileName)!
        let coinTemplate = coinScene.childNode(withName: "Coin")
        return coinTemplate as! SKSpriteNode
    }

    func createBackgroundOverlay() {
        let backgroundOverlay = backgroundOverlayTemplate.copy() as! SKNode
        backgroundOverlay.position = CGPoint(x: 0.0, y: levelPositionY)
        bgNode.addChild(backgroundOverlay)
        levelPositionY += backgroundOverlayHeight
    }
    
    func isNodeVisible(_ node: SKNode, positionY: CGFloat)
        -> Bool {
            if !camera!.contains(node) {
                if positionY < camera!.position.y - size.height * 2.0 {
                    return false
                } }
            return true
    }
    
    // Lad textures into array then create animate action
    func setupAnimationWithPrefix(_ prefix: String, start: Int,
                                  end: Int, timePerFrame: TimeInterval) -> SKAction {
        var textures = [SKTexture]()
        for i in start...end {
            textures.append(SKTexture(imageNamed: "\(prefix)\(i)"))
        }
        return SKAction.animate(with: textures,
                                timePerFrame: timePerFrame)
    }
    
    func runPlayerAnimation(_ animation: SKAction) {
        if currentPlayerAnimation == nil
            || currentPlayerAnimation! != animation {
            player.removeAction(forKey: "playerAnimation")
            player.run(animation, withKey: "playerAnimation")
            currentPlayerAnimation = animation
        } }
    
    func updateRedAlert(_ lastUpdateTime: TimeInterval) {
        // 1
        redAlertTime += lastUpdateTime
        let amt: CGFloat = CGFloat(redAlertTime) * π * 2.0 / 1.93725
        let colorBlendFactor = (sin(amt) + 1.0) / 2.0
        // 2
        for bgChild in bgNode.children {
            for node in bgChild.children {
                if let sprite = node as? SKSpriteNode {
                    let nodePos = bgChild.convert(sprite.position, to: self)
                    // 3
                    if !isNodeVisible(sprite, positionY: nodePos.y) {
                        sprite.removeFromParent()
                    } else {
                        sprite.color = SKColorWithRGB(255, g: 0, b: 0)
                        sprite.colorBlendFactor = colorBlendFactor
                    }
                }
            }
            // 4
            if bgChild.name == "Overlay"
                && bgChild.children.count == 0 {
                bgChild.removeFromParent()
            }
        }
    }
    
    func createRandomExplosion() {
        let cameraPos = camera!.position
        let sceneSize = self.size
        let explosionPos = CGPoint(x: CGFloat.random(min: 0.0,
        max: cameraPos.x * 2.0), y: CGFloat.random(min:
        cameraPos.y - sceneSize.height / 2, max: cameraPos.y + sceneSize.height * 0.35))
        // 2
        let randomNum = Int(arc4random_uniform(2)+1)
        if randomNum == 3 {
            screenShakeByAmt(10)
        }
        // 3
        let explode = explosion(intensity: 0.1
            * CGFloat(randomNum + 1))
        explode.position = convert(explosionPos, to: bgNode)
        explode.run(SKAction.removeFromParentAfterDelay(2.0))
        bgNode.addChild(explode)
    }
 
    
    // Particles Effect
    func explosion(intensity: CGFloat) -> SKEmitterNode {
        let emitter = SKEmitterNode()
        let particleTexture = SKTexture(imageNamed: "Spark")
        emitter.zPosition = 2
        emitter.particleTexture = particleTexture
        emitter.particleBirthRate = 4000 * intensity
        emitter.numParticlesToEmit = Int(400 * intensity)
        emitter.particleLifetime = 2.0
        emitter.emissionAngle = CGFloat(90.0).degreesToRadians
        emitter.emissionAngleRange = CGFloat(360.0).degreesToRadians
        emitter.particleSpeed = 600 * intensity
        emitter.particleSpeedRange = 1000 * intensity
        emitter.particleAlpha = 1.0
        emitter.particleAlphaRange = 0.25
        emitter.particleScale = 1.2
        emitter.particleScaleRange = 2.0
        emitter.particleScaleSpeed = -1.5
        emitter.particleColorBlendFactor = 1
        emitter.particleBlendMode = SKBlendMode.add
        let wait = SKAction.wait(forDuration: 0.5)
        let removeNode = SKAction.removeFromParent()
        emitter.run(SKAction.sequence([wait, removeNode]))
        let sequence = SKKeyframeSequence(capacity: 5)
        sequence.addKeyframeValue(SKColor.white, time: 0)
        sequence.addKeyframeValue(SKColor.yellow, time: 0.10)
        sequence.addKeyframeValue(SKColor.orange, time: 0.15)
        sequence.addKeyframeValue(SKColor.red, time: 0.75)
        sequence.addKeyframeValue(SKColor.black, time: 0.95)
        emitter.particleColorSequence = sequence
        return emitter
    }
    
    func addTrail(name: String) -> SKEmitterNode {
        let trail = SKEmitterNode(fileNamed: name)!
        trail.zPosition = -1
        trail.targetNode = fgNode
        player.addChild(trail)
        return trail
    }
    func removeTrail(trail: SKEmitterNode) {
        trail.numParticlesToEmit = 1
        let wait = SKAction.wait(forDuration: 1.0)
        let removeNode = SKAction.removeFromParent()
        trail.run(SKAction.sequence([wait, removeNode]))
    }
    
    func emitParticles(name: String, sprite: SKSpriteNode) {
        let pos = fgNode.convert(sprite.position,
                                 from: sprite.parent!)
        let particles = SKEmitterNode(fileNamed: name)!
        particles.position = pos
        particles.zPosition = 3
        fgNode.addChild(particles)
        particles.run(SKAction.removeFromParentAfterDelay(1.0))
        sprite.run(SKAction.sequence(
            [SKAction.scale(to: 0.0, duration: 0.5),
             SKAction.removeFromParent()]))
    }
    
    func playBackgroundMusic(name: String) {
        if let backgroundMusic = childNode(withName: "backgroundMusic") {
            backgroundMusic.removeFromParent() 
        }
        let music = SKAudioNode(fileNamed: name)
        music.name = "backgroundMusic"
        music.autoplayLooped = true
        addChild(music)
    }
}
