

// Created on: 12-Dec-2018
// Created by: Natalie Beshara
// Created for: ICS3U
// This program is a SpriteKit template

// this will be commented out when code moved to Xcode
import PlaygroundSupport


import SpriteKit
var wantSoundOn = true

class SplashScene: SKScene, SKPhysicsContactDelegate {
    let splashSceneBackground = SKSpriteNode(imageNamed: "splashSceneImage.png")
    let moveToNextSceneDelay = SKAction.wait(forDuration: 5.0)
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        self.backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        splashSceneBackground.name = "Splash Scene Background"
        splashSceneBackground.position = CGPoint(x: frame.midX, y: frame.midY)
        splashSceneBackground.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(splashSceneBackground)
        
        splashSceneBackground.run(moveToNextSceneDelay) {
            
            let mainMenuScene = MainMenuScene(size: self.size)
            self.view!.presentScene(mainMenuScene)
        }
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let mainMenuScene = MainMenuScene(size: self.size)
        self.view!.presentScene(mainMenuScene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}
class MainMenuScene: SKScene, SKPhysicsContactDelegate {
    let startButton = SKSpriteNode(imageNamed: "IMG_4560.PNG")
    let settingsButton = SKSpriteNode(imageNamed: "IMG_5159.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        self.backgroundColor = SKColor(red: 0.5, green: 0.5, blue: 0.05, alpha: 1.0)
        
        startButton.position = CGPoint(x: (frame.size.width / 2), y: 100)
        startButton.name = "start button"
        self.addChild(startButton)
        startButton.setScale(0.65)
        
        settingsButton.position = CGPoint(x: frame.maxX - 50, y: frame.size.height - 50)
        settingsButton.name = "settings button"
        self.addChild(settingsButton)
        settingsButton.setScale(0.10)
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
            let touch = touches as! Set<UITouch>
            let positionInScene = touch.first!.location(in: self)
            let touchedNode = self.atPoint(positionInScene)
            
            if let startButton = touchedNode.name {
                if startButton == "start button" {
                    let mainGameScene = MainGameScene(size: self.size)
                    self.view!.presentScene(mainGameScene)
                }
            }
        
        if let settingsButton = touchedNode.name {
            if settingsButton == "settings button" {
                let settingsScene = SettingsScene(size: self.size)
                self.view!.presentScene(settingsScene)
            }
        }
            
        }

    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class SettingsScene: SKScene, SKPhysicsContactDelegate {
    let menuButton = SKSpriteNode(imageNamed: "menu_button.png")
    let soundLabel = SKLabelNode(fontNamed: "Chalkduster")
    let soundOnButton = SKSpriteNode(imageNamed: "IMG_5155.PNG")
    let soundOffButton = SKSpriteNode(imageNamed: "IMG_5156.PNG")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        self.backgroundColor = SKColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        soundLabel.text = "Sound"
        soundLabel.zPosition = 1.0
        soundLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        soundLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        soundLabel.fontSize = 70
        soundLabel.position = CGPoint(x: (frame.size.width), y: frame.midY + 50)
        self.addChild(soundLabel)
        
        menuButton.position = CGPoint(x: (frame.size.width / 2), y: frame.size.height / 6)
        menuButton.name = "menu button"
        menuButton.zPosition = 2.0
        self.addChild(menuButton)
        menuButton.setScale(0.01)
        
        soundOnButton.position = CGPoint(x: (frame.midX - 150), y: frame.midY)
        soundOnButton.name = "sound on button"
        soundOnButton.zPosition = 3.0
        self.addChild(soundOnButton)
        menuButton.setScale(0.10)
        
        soundOffButton.position = CGPoint(x: (frame.midX + 150), y: frame.midY)
        soundOffButton.name = "sound off button"
        soundOffButton.zPosition = 4.0
        self.addChild(soundOffButton)
        soundOffButton.setScale(1.00)
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let touch = touches as! Set<UITouch>
        let positionInScene = touch.first!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let menuButton = touchedNode.name {
            if menuButton == "menu button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
        
        if let soundOnButton = touchedNode.name {
            if soundOnButton == "sound on button" {
                wantSoundOn = true
            }
        }
        
        if let soundOffButton = touchedNode.name {
            if soundOffButton == "sound off button" {
                wantSoundOn = false
            }
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

class MainGameScene: SKScene, SKPhysicsContactDelegate {
    let ship = SKSpriteNode(imageNamed: "IMG_4449.PNG")
    let leftButton = SKSpriteNode(imageNamed:"IMG_4664.PNG")
    let rightButton = SKSpriteNode(imageNamed:"IMG_4663.PNG")
    let fireButton = SKSpriteNode(imageNamed: "redButton.png")
    let scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    let highScoreLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    var score : Int = 0
    var highScore : Int = 0
    var isShipStillAlive = true
    
    var leftButtonPressed = false
    var rightButtonPressed = false
    var fireButtonPressed = false
    
    var missiles = [SKSpriteNode]()
    var aliens = [SKSpriteNode]()
    var alienAttackRate: Double = 1
    
    let collisionMissileCatergory: UInt32 = 1
    let collisionAlienCatergory: UInt32 = 2
    let collisionSpaceShipCatergory: UInt32 = 4
    
    func createAlien() {
        //
        
        let aSingleAlien = SKSpriteNode(imageNamed: "alien.png")
        aSingleAlien.name = "alien"
        aSingleAlien.zPosition = 7.0
        aSingleAlien.physicsBody?.isDynamic = true
        aSingleAlien.physicsBody = SKPhysicsBody(texture: aSingleAlien.texture!, size: aSingleAlien.size)
        aSingleAlien.physicsBody?.affectedByGravity = false
        aSingleAlien.physicsBody?.usesPreciseCollisionDetection = true
        aSingleAlien.physicsBody?.categoryBitMask = collisionAlienCatergory
        aSingleAlien.physicsBody?.contactTestBitMask = collisionMissileCatergory
        aSingleAlien.physicsBody?.collisionBitMask = 0x0
        let alienStartPositionX = Int(arc4random_uniform(UInt32(frame.size.width - 0 + 1)))
        let alienEndPositionX = Int(arc4random_uniform(UInt32(frame.size.width - 0 + 1)))
        aSingleAlien.position = CGPoint(x: alienStartPositionX, y: Int(frame.size.height) + 100)
        let alienMove = SKAction.move(to: CGPoint(x: alienEndPositionX, y:  -100), duration: 4)
        aSingleAlien.run(alienMove)
        self.addChild(aSingleAlien)
        aliens.append(aSingleAlien)
    }
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        
        // turn on physics collision detection
        self.physicsWorld.contactDelegate =  self
        
        highScore = UserDefaults.standard.integer(forKey: "highscore")
        
        self.backgroundColor = SKColor(red: 0.00, green:0.15, blue:0.15, alpha: 1.0)
        
        let backgroundImage = SKSpriteNode(imageNamed: "star_background.png")
        backgroundImage.name = "background image"
        backgroundImage.zPosition = 1.0
        backgroundImage.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        backgroundImage.size = CGSize(width: frame.size.width, height: frame.size.height)
        self.addChild(backgroundImage)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.zPosition = 2.0
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scoreLabel.fontSize = 50
        scoreLabel.position = CGPoint(x: 25, y: frame.size.height - 50)
        self.addChild(scoreLabel)
        
        highScoreLabel.text = "High Score: " + String(highScore)
        highScoreLabel.zPosition = 2.5
        highScoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        highScoreLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        highScoreLabel.fontSize = 50
        highScoreLabel.position = CGPoint(x: frame.size.width - 25, y: frame.size.height - 50)
        self.addChild(highScoreLabel)
        
        ship.position = CGPoint(x: (frame.size.width / 2), y: 100)
        ship.name = "space ship"
        ship.zPosition = 3.0
        ship.physicsBody?.isDynamic = true
        ship.physicsBody = SKPhysicsBody(texture: ship.texture!, size: ship.size)
        ship.physicsBody?.affectedByGravity = false
        ship.physicsBody?.usesPreciseCollisionDetection = true
        ship.physicsBody?.categoryBitMask = collisionSpaceShipCatergory
        ship.physicsBody?.contactTestBitMask = collisionAlienCatergory
        ship.physicsBody?.collisionBitMask = 0x0
        self.addChild(ship)
        ship.setScale(0.65)
        
        leftButton.name = "left button"
        leftButton.zPosition = 4.0
        leftButton.position = CGPoint(x: 100, y: 100)
        leftButton.alpha = 0.5
        self.addChild(leftButton)
        leftButton.setScale(0.75)
        
        rightButton.name = "right button"
        rightButton.zPosition = 5.0
        rightButton.position = CGPoint(x: 300, y: 100)
        rightButton.alpha = 0.5
        self.addChild(rightButton)
        rightButton.setScale(0.75)
        
        fireButton.name = "fire button"
        fireButton.zPosition = 6.0
        fireButton.position = CGPoint(x: frame.size.width - 100, y: 100)
        fireButton.alpha = 0.5
        self.addChild(fireButton)
        rightButton.setScale(0.75)
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        if rightButtonPressed == true && ship.position.x <= (frame.size.width){
            var moveShipRight = SKAction.moveBy(x: 10, y: 0, duration : 0.1)
            ship.run(moveShipRight)
        }
            
        else if leftButtonPressed == true && ship.position.x >= 0 {
            var moveShipLeft = SKAction.moveBy(x: -10, y: 0, duration: 0.1)
            ship.run(moveShipLeft)     
            
        }
        
        let createAlienChance = Int(arc4random_uniform(120) + 1)
        if createAlienChance <= Int(alienAttackRate) {
            createAlien()
        }
        
        for aSingleMissile in missiles {
            if aSingleMissile.position.y > frame.size.height {
                aSingleMissile.removeFromParent()
                missiles.removeFirst()
            }
        }
        
        for aSingleAlien in aliens {
        if aSingleAlien.position.y <  -50{
            aSingleAlien.position.x = -500
            aSingleAlien.position.y = 5000
            aSingleAlien.removeFromParent()
            aliens.removeFirst()
            
            if isShipStillAlive == true {
                score -= 2
                scoreLabel.text = "Score: " + String(score)
                }
            
            }
        }
        
        if score < 0 {
            score = 0
            scoreLabel.text = "Score: " + String(score)
        }
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        let secondNode = contact.bodyB.node as! SKSpriteNode
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionAlienCatergory | collisionMissileCatergory)) {
            
            var emitterNode2 = SKEmitterNode(fileNamed: "Spark.sks")
            emitterNode2?.zPosition = 9.0
            emitterNode2?.particlePosition = (contact.bodyA.node?.position)!
            self.addChild(emitterNode2!)
            self.run(SKAction.wait(forDuration: 2), completion: { emitterNode2?.removeFromParent() })
            
            if wantSoundOn == true {
                ship.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
            }
            
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            alienAttackRate += 0.05
            
            if isShipStillAlive == true {
                score += 1
                scoreLabel.text = "Score: " + String(score)
                
                if score > highScore {
                    highScore = score
                    highScoreLabel.text = "High Score: " + String(highScore)
                    UserDefaults().set(highScore, forKey: "highscore")
                }
                
            }
        }
        
        if ((contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (collisionAlienCatergory | collisionSpaceShipCatergory)) {
            
            if wantSoundOn == true {
                ship.run(SKAction.playSoundFileNamed("BarrelExploding.wav", waitForCompletion: false))
            }
            
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            alienAttackRate += 0.05
            
            var emitterNode = SKEmitterNode(fileNamed: "ExplosionParticle.sks")
            emitterNode?.zPosition = 10.0
            emitterNode?.particlePosition = (contact.bodyA.node?.position)!
            self.addChild(emitterNode!)
            self.run(SKAction.wait(forDuration: 2), completion: { emitterNode?.removeFromParent() })
            
            isShipStillAlive = false
            
            let moveToNextSceneDelay = SKAction.wait(forDuration: 3.0)
            
            run(moveToNextSceneDelay) {
                
                let gameOverScene = GameOverScene(size: self.size)
                self.view?.presentScene(gameOverScene)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "left button" {
                leftButtonPressed = true
            }
            else if touchedNodeName == "right button" {
                rightButtonPressed = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
        var touch = touches as! Set<UITouch>
        var location = touch.first!.location(in: self)
        var touchedNode = self.atPoint(location)
        
        if let touchedNodeName = touchedNode.name {
            if touchedNodeName == "left button" {
                leftButtonPressed = false
            }
            else if touchedNodeName == "right button" {
                rightButtonPressed = false
            }
            else if touchedNodeName == "fire button" {
                
                let aMissile = SKSpriteNode(imageNamed: "missile.png")
                aMissile.position = CGPoint(x: ship.position.x, y: 100)
                aMissile.name = "missile"
                aMissile.zPosition = 8.0
                aMissile.physicsBody?.isDynamic = true
                aMissile.physicsBody = SKPhysicsBody(texture: aMissile.texture!, size: aMissile.size)
                aMissile.physicsBody?.affectedByGravity = false
                aMissile.physicsBody?.usesPreciseCollisionDetection = true
                aMissile.physicsBody?.categoryBitMask = collisionMissileCatergory
                aMissile.physicsBody?.contactTestBitMask = collisionAlienCatergory
                aMissile.physicsBody?.collisionBitMask = 0x0
                self.addChild(aMissile)
                let fireMissile = SKAction.moveTo(y: frame.size.height + 100, duration: 2)
                aMissile.run(fireMissile)
                missiles.append(aMissile)
                
                if wantSoundOn == true {
                    aMissile.run(SKAction.playSoundFileNamed("laser1.wav", waitForCompletion: false))
                }
                
            }
        }
    }
}

class GameOverScene: SKScene, SKPhysicsContactDelegate {
    let menuButton = SKSpriteNode(imageNamed: "menu_button.png")
    let gameOverLabel = SKLabelNode(fontNamed: "Chalkduster")
    
    override func didMove(to view: SKView) {
        // this is run when the scene loads
        gameOverLabel.text = "Game Over"
        gameOverLabel.zPosition = 1.0
        gameOverLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        gameOverLabel.fontColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        gameOverLabel.fontSize = 70
        gameOverLabel.position = CGPoint(x: (frame.size.width / 4), y: frame.midY + 30)
        self.addChild(gameOverLabel)
        
        menuButton.position = CGPoint(x: (frame.size.width / 2), y: frame.midY - 50)
        menuButton.name = "menu button"
        menuButton.zPosition = 2.0
        self.addChild(menuButton)
        menuButton.setScale(0.65)
        
    }
    
    override func  update(_ currentTime: TimeInterval) {
        //
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        //
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        let touch = touches as! Set<UITouch>
        let positionInScene = touch.first!.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let menuButton = touchedNode.name {
            if menuButton == "menu button" {
                let mainMenuScene = MainMenuScene(size: self.size)
                self.view!.presentScene(mainMenuScene)
            }
        }
        
    }
    
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //
        
    }
}

// this will be commented out when code moved to Xcode

// set the frame to be the size for your iPad
let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
let frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

let scene = SplashScene(size: frame.size)
scene.scaleMode = SKSceneScaleMode.resizeFill

let skView = SKView(frame: frame)
skView.showsFPS = true
skView.showsNodeCount = true
skView.presentScene(scene)

PlaygroundPage.current.liveView = skView
