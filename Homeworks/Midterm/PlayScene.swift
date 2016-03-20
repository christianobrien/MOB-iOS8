import SpriteKit

class PlayScene: SKScene, SKPhysicsContactDelegate {
    
    // Sprite nodes
    let runningBar = SKSpriteNode(imageNamed: "bottomBar")
    let hero = SKSpriteNode(imageNamed: "hero")
    let blockOne = SKSpriteNode(imageNamed: "block1")
    let blockTwo = SKSpriteNode(imageNamed: "block2")
    let scoreText = SKLabelNode(fontNamed: "Chalkduster")
    
    var originalRunningBarPositionX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 5
    var heroBaseline = CGFloat(0)
    var onGround = true
    var velocityY = CGFloat(0)
    let gravity = CGFloat(0.6)
    
    var blockMaxX = CGFloat(0)
    var originalBlockPositionX = CGFloat(0)
    var score : Int = 0
    
    enum ColliderType: UInt32 {
        case Hero = 1
        case Block = 2
    }
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.cyanColor()
        
        self.physicsWorld.contactDelegate = self //allows this class to affect and use physics
        
        self.runningBar.anchorPoint = CGPointMake(0, 0.5)
        self.runningBar.position = CGPointMake(
            CGRectGetMinX(self.frame),
            CGRectGetMinY(self.frame) + (self.runningBar.size.height / 2))
        
        self.originalRunningBarPositionX = self.runningBar.position.x
        // original X position; used to reset runningBar to make it look like an infinite loop
        
        self.maxBarX = self.runningBar.size.width - self.frame.size.width
        self.maxBarX *= -1
        
        self.heroBaseline =
            self.runningBar.position.y + (self.runningBar.size.height / 2) + (self.hero.size.height / 2)
        // set baseline in middle of runningBar + half the height; puts baseline on the top runningBar
        
        self.hero.position = CGPointMake(
            CGRectGetMinX(self.frame) + (self.hero.size.width * 3/4), self.heroBaseline)
        self.hero.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.hero.size.width/2))
        self.hero.physicsBody?.affectedByGravity = false // Set our own gravity
        self.hero.physicsBody?.categoryBitMask = ColliderType.Hero.rawValue // returns '1' from enum ColliderType
        self.hero.physicsBody?.contactTestBitMask = ColliderType.Block.rawValue // testing for Block ColliderType
        self.hero.physicsBody?.collisionBitMask = ColliderType.Block.rawValue // used to stop Hero movement
        
        
        // Position blocks (off the screen, doesn't move yet)
        self.blockOne.position = (CGPointMake(CGRectGetMaxX(self.frame) + self.blockOne.size.width, self.heroBaseline))
        self.blockTwo.position = (CGPointMake(CGRectGetMaxX(self.frame) + self.blockOne.size.width, self.heroBaseline + self.blockOne.size.height / 2))
        self.blockOne.physicsBody = SKPhysicsBody(rectangleOfSize: self.blockOne.size)
        self.blockOne.physicsBody?.dynamic = false // Don't want block to move on contact
        self.blockOne.physicsBody?.categoryBitMask = ColliderType.Block.rawValue // set collider type to Block ColliderType
        self.blockOne.physicsBody?.contactTestBitMask = ColliderType.Hero.rawValue // used to test collision
        self.blockOne.physicsBody?.collisionBitMask = ColliderType.Hero.rawValue // used to stop block
        self.blockTwo.physicsBody = SKPhysicsBody(rectangleOfSize: self.blockTwo.size)
        self.blockTwo.physicsBody?.dynamic = false // Don't want block to move on contact
        self.blockTwo.physicsBody?.categoryBitMask = ColliderType.Block.rawValue // set collider type to Block ColliderType
        self.blockTwo.physicsBody?.contactTestBitMask = ColliderType.Hero.rawValue // used to test collision
        self.blockTwo.physicsBody?.collisionBitMask = ColliderType.Hero.rawValue // used to stop block
        
        self.originalBlockPositionX = self.blockOne.position.x
        
        self.blockOne.name = "blockOne"
        self.blockTwo.name = "blockTwo"
        
        blockStatuses["blockOne"] = BlockStatus(isRunning: false, timeGapForNextRun: randomBlock(), currentInterval: UInt32(0))
        blockStatuses["blockTwo"] = BlockStatus(isRunning: false, timeGapForNextRun: randomBlock(), currentInterval: UInt32(0))
        
        self.scoreText.text = "0"
        self.scoreText.fontSize = 42
        self.scoreText.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.blockMaxX = 0 - self.blockOne.size.width / 2
        
        // add Children sprites
        self.addChild(self.runningBar)
        self.addChild(self.hero)
        self.addChild(self.blockOne)
        self.addChild(self.blockTwo)
        self.addChild(self.scoreText)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        died()
    }
    
    func died() {
        if let scene = GameScene(fileNamed: "GameScene") {
            let skView = self.view! as SKView
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            skView.presentScene(scene)
        }
    }
    
    func randomBlock() -> UInt32 { //UInt32 works easiest with arc4random_uniform
        // Number of update-frames for blocks to come in
        let range = UInt32(50) ... UInt32(200)
        return range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1)
    }
    
    var blockStatuses: Dictionary<String, BlockStatus> = [:]
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if onGround {
            self.velocityY = -18.0
            self.onGround = false
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.velocityY <= -9.0 {
            self.velocityY = -9.0
        }
    }
    
    override func update(currentTime: NSTimeInterval) {
        if self.runningBar.position.x <= maxBarX {
            self.runningBar.position.x = self.originalRunningBarPositionX
        }
    
        // Hero Jumps
        self.velocityY += self.gravity
        self.hero.position.y -= velocityY
        
        if self.hero.position.y < self.heroBaseline {
            self.hero.position.y = self.heroBaseline
            velocityY = 0.0
            self.onGround = true
        }
        
        // Rotate the hero
        let degreeRotation = CDouble(self.groundSpeed) * M_PI / 180
        
        // Rotate the hero
        self.hero.zRotation -= CGFloat(degreeRotation)
        
        // Move the Ground
        runningBar.position.x -= CGFloat(self.groundSpeed)
        
        // blockRunner method runs blocks on at correct time
        blockRunner()
    }
    
    func blockRunner() {
        for(block, blockStatus) in self.blockStatuses {
            let thisBlock = self.childNodeWithName(block)
            if blockStatus.shouldRunBlock() {
                blockStatus.timeGapForNextRun = randomBlock()
                blockStatus.currentInterval = 0
                blockStatus.isRunning = true
            }
            
            if blockStatus.isRunning {
                if thisBlock?.position.x > blockMaxX { // if on screen, continue running
                    thisBlock?.position.x -= CGFloat(self.groundSpeed)
                } else { // if off screen, move back to original position
                    thisBlock?.position.x = self.originalBlockPositionX
                    blockStatus.isRunning = false
                    self.score++
                    
                    if (self.score % 5) == 0 {
                        self.groundSpeed++
                    }
                    self.scoreText.text = String(self.score)
                }
            } else {
                blockStatus.currentInterval++
            }
            
        }
    }
    

    
}