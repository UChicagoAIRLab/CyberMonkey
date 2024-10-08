Welcome to Cybernaut, a platform game developed by the Airlab Team to bring cybersecurity awareness to life in an engaging and interactive way.
Our iOS app has been crafted with care to make learning about cybersecurity concepts enjoyable. Inspired by classics like Doodlejump, Cybernaut 
challenges players to guide a small astronaut through a digital landscape filled with obstacles and opportunities. Navigate the game by rotating 
your phone to move the astronaut upward, hopping from platform to platform. But beware! Mistakes can lead to your astronaut plunging into the fiery
depths below. Cybernaut blends gaming with education. If your astronaut meets an untimely demise, you'll have the chance to redeem yourself by answering 
simple questions about internet safety and privacy. Embark on a journey through the digital universe with Cybernaut. Explore, learn, and conquer challenges 
together as we navigate the complexities of cybersecurity.

If you are looking to fork this branch and continue contributing to this project, below is a small tour of the different Swift files spanning this project
to help you get started.

TutorialViewController:
This Swift file, TutorialViewController.swift, along with its associated SKScene subclasses, is responsible for managing the tutorial screens. Let's break down its components and functionalities:

This class is a subclass of UIViewController and serves as the view controller for displaying the tutorial screens. In viewDidLoad(), it hides the navigation bar and initializes the first tutorial scene (TutorialScene) by loading it from the corresponding SKScene file.            

TutorialScene Classes:
Each TutorialScene subclass represents a specific tutorial screen in the game.
The scenes are created using SpriteKit and are loaded dynamically based on user interaction with an arrow button.
Each scene consists of a SKNode representing the arrow button, which the user taps to navigate to the next tutorial screen.
The didMove(to:) method is called when the scene is presented in the view. It sets up a tap gesture recognizer to detect taps on the arrow button.
The handleTap(_:) method is triggered when the user taps on the arrow button. It checks if the tap occurred on the arrow button and transitions to the next tutorial scene if so.
The sceneDidLoad() method sets the scale mode of the scene to ensure it fits the view properly.
Navigation Between Tutorial Screens:

Each tutorial scene contains an arrow button that, when tapped, triggers the transition to the next tutorial scene.
The handleTap(_:) method detects taps on the arrow button and presents the next tutorial scene accordingly.
This sequence continues until the user has navigated through all the tutorial screens.
Gesture Recognition:

Tap gestures are used to detect user interaction with the arrow button in each tutorial scene.
The tap gesture recognizer is added to the view to capture taps anywhere on the screen.
HomeScreenViewController:

Properties:
public var IsGamePlayModeHard = false: This boolean property indicates whether the game is being played in hard mode or not. It defaults to false.
View Lifecycle Methods:

viewDidLoad(): This method is called after the view controller's view has been loaded into memory. Here, the navigation bar is hidden.
IBAction Methods:

play(_ sender: UIButton): This method is triggered when the "Play" button is tapped. It instantiates a GameViewController, configures its isgameHard property based on the IsGamePlayModeHard property, and presents it modally.
tutorial(_ sender: UIButton): This method is triggered when the "How To Play" button is tapped. It instantiates a TutorialViewController and presents it modally.
gameCenter(_ sender: UIButton): This method is triggered when the "Game Center" button is tapped. It invokes a method from GameKitHelper to show the Game Center view controller.
easy_mode(_ sender: UIButton): This method is triggered when the "Easy Mode" button is tapped. It sets IsGamePlayModeHard to false.
hard_mode(_ sender: UIButton): This method is triggered when the "Hard Mode" button is tapped. It sets IsGamePlayModeHard to true.
User Interface Interactions:

The @IBAction methods are connected to buttons in the storyboard using Interface Builder. They respond to user interactions such as button taps.

GameScene.swift:

The file contains Swift code that implements the game's logic, including player movement, scoring mechanisms, level generation, platform interactions, and various visual effects. It integrates with SpriteKit, Apple's framework for building 2D games, to manage scenes, nodes, physics, animations, and other game-related components.

Enums for Game and Player States:

GameStatus enum defines various states of the game such as waiting for input, playing, or game over.
PlayerStatus enum represents different states of the player character, like idle, jumping, falling, or dead.
Physics Categories:

The PhysicsCategory struct assigns unique bit masks to different physics categories like player, platforms, coins, monsters, etc., used for collision detection.
Extensions:

Extensions for BinaryInteger and FloatingPoint to convert between degrees and radians, enabling easier trigonometric calculations.
Helper Function:

hexStringToUIColor function converts hex strings to UIColor objects, useful for customizing UI elements with colors defined in hex format.
GameMenuView Class:

This class subclasses UIStackView to create a customizable menu view for the game, with options for answering questions and skipping.
GameScene Class:

This is the main scene class representing the game environment.

Properties:

Define various elements of the game world such as background, player, platforms, coins, HUD elements, etc.
Methods:

Implement game logic including player movement, collision handling, enemy spawning, scoring, power-up collection, and UI updates.
Overrides:

Implement methods like didMove(to:) for scene initialization, touchesBegan(:with:) to handle user input, and update(:) for periodic updates of game elements.
Audio Playback:

Utilizes SKAction.playSoundFileNamed to play various sound effects like jumping, collecting coins, or collisions.
Question Handling:

Includes functionality for presenting True/False questions to the player, with logic for answering questions correctly or incorrectly, affecting gameplay.
Scene Management:

Manages scene transitions, camera positioning, and background music playback.
Game Difficulty:

Provides an option for adjusting game difficulty, affecting gameplay mechanics and question selection.
Camera Management with updateCamera():

The updateCamera() method ensures that the camera follows the player smoothly while maintaining a minimum distance from the lava. It calculates the target position for the camera based on the player's position and adjusts it with a lag factor for smooth movement. This method enhances the gameplay experience by providing a dynamic and responsive camera view.
Player Control and Interaction with updatePlayer():

The updatePlayer() method handles player control based on accelerometer data, allowing tilt-based movement. It ensures that the player wraps around the edges of the screen seamlessly, enhancing the game's playability. Additionally, it updates the player's score based on vertical position, rewarding the player for ascending higher and adding a layer of progression to the game.
Bomb Drop Sequence with bombDrop():

The bombDrop() method initiates the bomb-drop sequence by scaling out title and ready labels and animating the bomb to bounce. It incorporates sound effects and transitions the game state to waiting for the bomb, setting the stage for the gameplay to unfold.
Game Initialization and Setup with startGame() and setupNodes():

The startGame() method sets up the game environment post-bomb drop, triggering explosion effects, screen shaking, and initiating player movement. setupNodes() initializes various game elements such as the background, foreground, player, coins, and HUD elements, establishing the foundation for gameplay interactions.
Quiz Setup and Interaction with setupSecondChanceQuiz():

The setupSecondChanceQuiz() method prepares a menu view for presenting true/false questions, pausing the game and setting the stage for a quiz-based interaction. It integrates with user interaction callbacks to handle user responses and advance the game accordingly, offering an engaging secondary gameplay mechanic.
Player Velocity Manipulation with superBoostPlayer():

The superBoostPlayer() method provides a significant velocity boost to the player, allowing for rapid upward movement. This function enhances gameplay dynamics, offering players a powerful tool to navigate obstacles or reach higher platforms quickly.
Scoring Mechanisms with increaseScoreRegularPlatform() and increaseScoreBreakPlatform():

These methods increment the player's score based on specific game events. increaseScoreRegularPlatform() awards points when the player lands on regular platforms, incentivizing successful platforming. increaseScoreBreakPlatform() awards higher points for landing on breakable platforms, encouraging risk-taking and strategic gameplay.
Platform Interaction with platformAction():

The platformAction() method defines interactions between the player and platforms. It incorporates visual effects such as screen shaking and removes breakable platforms upon interaction. Additionally, it triggers player jumps and updates the score based on the type of platform interaction, adding depth to gameplay mechanics.
Dynamic Level Generation with addRandomForegroundOverlay():

This method generates random foreground overlays, including various platform types and breakable elements, contributing to diverse and unpredictable level layouts. It ensures procedural level generation, keeping the gameplay fresh and challenging across multiple playthroughs.
Utility Functions and Effects:

Several utility functions, such as loadForegroundOverlayTemplate() and loadCoin(), facilitate the loading and instantiation of game assets. Effects like screen shake, particle emissions, and dynamic color changes enrich the visual and auditory experience, adding flair and excitement to gameplay moments.
Animation Management and Visual Effects:

Methods like setupAnimationWithPrefix() and runPlayerAnimation() manage sprite animations, enhancing visual feedback and player engagement. Particle effects, explosions, and dynamic color alterations further elevate the game's aesthetic appeal, creating immersive and memorable gameplay moments.
Adding New Questions:

QuestionBank.swift:

This file defines the QuestionBank class, which represents a collection of multiple-choice questions on various topics related to online safety, digital privacy, and other relevant subjects. The class provides functionality to initialize the question bank with predefined questions and allows adding new questions.

Components of a Multiple Choice Question:

Question Text: The main prompt or query presented to the user.
Choices: Options provided to the user to select from as potential answers to the question.
Correct Answer: Indicates which choice is the correct answer to the question.
Difficulty Level: Denotes the difficulty level of the question, categorized as either "easy" or "hard".

Adding a New Question:

To add a new question to the QuestionBank, follow these steps:

Instantiate a New Question Object: Create a new instance of the Question class and provide values for the question text, choices, correct answer, and difficulty level.
Add the Question to the Question Bank: Append the newly created Question object to the list property of the QuestionBank class.
Ensure Correctness and Clarity: Double-check that the question text, choices, and correct answer are accurately represented. Make sure the difficulty level is correctly specified.
Compile and Test: After adding the question, compile and test the code to ensure that the new question is integrated correctly into the QuestionBank.
Example Usage:

Suppose we want to add a new question to the QuestionBank. Here's how we would do it:

list.append(Question(questionText: "What is the capital of France?",
                     choiceA: "London",
                     choiceB: "Paris",
                     choiceC: "Berlin",
                     correctAnswerText: 1, // Correct answer is "Paris"
                     is_hardBool: false)) // Difficulty level is easy

By following these guidelines, you can effectively document and add new multiple-choice questions to 
the QuestionBank class in your Swift codebase. Ensure clarity, correctness, and consistency when adding 
questions to maintain the integrity of your question bank.
