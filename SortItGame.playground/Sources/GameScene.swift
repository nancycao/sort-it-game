import Foundation
import SpriteKit

public class GameScene: SKScene {
    let itemList = ["SoiledNapkins", "ShoeBox", "PlasticBag", "SodaCan", "GlassBottle", "Pizza", "Paper", "Milk", "Takeout", "Banana"]
    var currentitemIndex = 0
    
    // labels that change
    var scoreLabel: SKLabelNode!
    var playAgainLabel: SKLabelNode!
    var feedbackTitleLabel: SKLabelNode!
    var feedbackTextLabel: SKLabelNode!
    var itemTextLabel: SKLabelNode!
    var statusTextLabel: SKLabelNode!
    var statusMedalLabel:SKLabelNode!
    var score = 0
    
    public override func sceneDidLoad() {
        backgroundColor = SKColor.white
        startGame()
        generateItem()
    }
    
    public func startGame() {
        let blueBin = SKSpriteNode(imageNamed: "BlueBin.png")
        blueBin.name = "blueBin"
        blueBin.setScale(0.15)
        blueBin.position = CGPoint(x: 70, y: 655)
        addChild(blueBin)
        
        let greenBin = SKSpriteNode(imageNamed: "GreenBin.png")
        greenBin.name = "greenBin"
        greenBin.setScale(0.15)
        greenBin.position = CGPoint(x: 149, y: 655)
        addChild(greenBin)
        
        let brownbin = SKSpriteNode(imageNamed: "BrownBin.png")
        brownbin.name = "brownBin"
        brownbin.setScale(0.15)
        brownbin.position = CGPoint(x: 227, y: 655)
        addChild(brownbin)
        
        let blackbin = SKSpriteNode(imageNamed: "BlackBin.png")
        blackbin.name = "blackBin"
        blackbin.setScale(0.15)
        blackbin.position = CGPoint(x: 305, y: 655)
        addChild(blackbin)
        
        let scoreTextLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        scoreTextLabel.text = "SCORE"
        scoreTextLabel.fontSize = 15
        scoreTextLabel.fontColor = SKColor.black
        scoreTextLabel.position = CGPoint(x: 190, y: 785)
        addChild(scoreTextLabel)
        
        scoreLabel = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        scoreLabel.text = "\(score)"
        scoreLabel.fontSize = 30
        scoreLabel.fontColor = SKColor.black
        scoreLabel.position = CGPoint(x: 190, y: 750)
        addChild(scoreLabel)
        
        feedbackTitleLabel = SKLabelNode(fontNamed: "HelveticaNeue-Medium")
        feedbackTitleLabel.fontSize = 20
        feedbackTitleLabel.fontColor = SKColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0)
        feedbackTitleLabel.position = CGPoint(x: 190, y: 525)
        addChild(feedbackTitleLabel)
        
        feedbackTextLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        feedbackTextLabel.fontSize = 15
        feedbackTextLabel.fontColor = SKColor.black
        feedbackTextLabel.position = CGPoint(x: 190, y: 470)
        feedbackTextLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        feedbackTextLabel.numberOfLines = 0
        feedbackTextLabel.preferredMaxLayoutWidth = 250
        addChild(feedbackTextLabel)
        
        // play again label
        playAgainLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        playAgainLabel.name = "playAgainLabel"
        playAgainLabel.text = "play again!"
        playAgainLabel.fontSize = 30
        playAgainLabel.fontColor = SKColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0)
        playAgainLabel.position = CGPoint(x: 190, y: 295)
        playAgainLabel.isHidden = true
        addChild(playAgainLabel)
        
        itemTextLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        itemTextLabel.fontSize = 15
        itemTextLabel.fontColor = SKColor.black
        itemTextLabel.position = CGPoint(x: 187, y: 285)
        addChild(itemTextLabel)
        
        statusTextLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        statusTextLabel.fontSize = 15
        statusTextLabel.fontColor = SKColor.black
        statusTextLabel.position = CGPoint(x: 187, y: 335)
        addChild(statusTextLabel)
        
        statusMedalLabel = SKLabelNode(fontNamed: "HelveticaNeue-Light")
        statusMedalLabel.fontSize = 30
        statusMedalLabel.fontColor = SKColor.black
        statusMedalLabel.position = CGPoint(x: 187, y: 365)
        addChild(statusMedalLabel)
    }
    
    public func generateItem() {
        let itemName = itemList[currentitemIndex]
        let scaleValueDict = [ "Paper": 0.28,
                               "Milk" : 0.12,
                               "Takeout": 0.3,
                               "Banana": 0.2,
                               "GlassBottle": 0.04,
                               "Pizza": 0.3,
                               "SodaCan": 0.3,
                               "PlasticBag": 0.23,
                               "ShoeBox": 0.5,
                               "SoiledNapkins": 0.23
                             ]
        let itemText = [ "Paper": "paper ball",
                         "Milk" : "milk carton",
                         "Takeout": "chinese takeout",
                         "Banana": "banana peel",
                         "GlassBottle": "glass bottle",
                         "Pizza": "pizza",
                         "SodaCan": "soda can",
                         "PlasticBag": "plastic bag",
                         "ShoeBox": "shoe box",
                         "SoiledNapkins": "dirty napkins"
                        ]
        let yValueAdj = [ "Paper": -25,
                         "Milk" : -20,
                         "Takeout": -20,
                         "Banana": -25,
                         "GlassBottle": -5,
                         "Pizza": -20,
                         "SodaCan": -10,
                         "PlasticBag": -10,
                         "ShoeBox": -15,
                         "SoiledNapkins": -5
                        ]
        let item = SKSpriteNode(imageNamed: itemName + ".png")
        item.name = itemName
        let scaleValue = CGFloat(scaleValueDict[itemName]!)
        item.setScale(scaleValue)
        item.position = CGPoint(x: 185, y: 375 + yValueAdj[itemName]!)
        
        itemTextLabel.text = itemText[itemName]
        addChild(item)
    }
    
    public func updateCorrectFeedback(item: String) {
        feedbackTitleLabel.isHidden = false
        feedbackTextLabel.isHidden = false

        let correctFeedback = [ "Paper": "Paper items belong in the green recycling bin! 😊",
                                  "Milk": "Cartons belong in the blue recycling bin! 😊",
                                  "Takeout": "Food-stained items belong in the black trash bin! 😊",
                                  "Banana": "Banana peels belong in the brown compost bin! 😊",
                                  "GlassBottle": "Glass bottles belong in the blue recycling bin! 😊",
                                  "Pizza": "Leftover pizza belongs in the brown compost bin! 😊",
                                  "SodaCan": "Aluminum soda cans belong in the blue recycling bin! 😊",
                                  "PlasticBag": "Non-rigid plastic items belong in the black trash bin 😊",
                                  "ShoeBox": "Cardboard items belong in the green recycling bin! 😊",
                                  "SoiledNapkins": "Dirty napkins belong in the black trash bin! 😊"
                              ]
        feedbackTitleLabel.fontColor = SKColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0)
        feedbackTitleLabel.text = "CORRECT"
        feedbackTextLabel.text = correctFeedback[item]
    }
    
    public func updateIncorrectFeedback(item: String) {
        feedbackTitleLabel.isHidden = false
        feedbackTextLabel.isHidden = false
        let incorrectFeedback = [ "Paper": "Paper items belong in the green recycling bin! 😓",
                                  "Milk": "Cartons belong in the blue recycling bin! 😓",
                                  "Takeout": "Food-stained items belong in the black trash bin! 😓",
                                  "Banana": "Banana peels belong in the brown compost bin! 😓",
                                  "GlassBottle": "Glass bottles belong in the blue recycling bin! 😓",
                                  "Pizza": "Leftover pizza belongs in the brown compost bin! 😓",
                                  "SodaCan": "Aluminum soda cans belong in the blue recycling bin! 😓",
                                  "PlasticBag": "Non-rigid plastic items belong in the black trash bin 😓",
                                  "ShoeBox": "Cardboard items belong in the green recycling bin! 😓",
                                  "SoiledNapkins": "Dirty napkins belong in the black trash bin! 😓"
        ]
        feedbackTitleLabel.fontColor = SKColor.red
        feedbackTitleLabel.text = "UH-OH"
        feedbackTextLabel.text = incorrectFeedback[item]
    }
    
    public func correctUpdateScore() {
        score += 10
        scoreLabel.fontColor = SKColor(red: 0.0824, green: 0.749, blue: 0.2235, alpha: 1.0)
        scoreLabel.text = "\(score)"
    }
    
    public func incorrectUpdateScore() {
        score -= 5
        scoreLabel.fontColor = SKColor.red
        scoreLabel.text = "\(score)"
    }
    
    // updates item + calls update for feedback & score
    public func update(bin: String) {
        let answerKey = [ "Paper": "greenBin",
                          "Milk": "blueBin",
                          "Takeout": "blackBin",
                          "Banana": "brownBin",
                          "GlassBottle": "blueBin",
                          "Pizza": "brownBin",
                          "SodaCan": "blueBin",
                          "PlasticBag": "blackBin",
                          "ShoeBox": "greenBin",
                          "SoiledNapkins": "blackBin"
                        ]

        if currentitemIndex < itemList.count {
            let currentItem = itemList[currentitemIndex]
            throwItem(binName: bin)
            // update item, score, and feedback
            if answerKey[currentItem] == bin {
                correctUpdateScore()
                updateCorrectFeedback(item: currentItem)
            }
            else {
                incorrectUpdateScore()
                updateIncorrectFeedback(item: currentItem)
            }
            currentitemIndex += 1
            if currentitemIndex < itemList.count {
                generateItem()
            }
        }
        // reached end of itemList
        if currentitemIndex == itemList.count {
            playAgainLabel.isHidden = false
            itemTextLabel.isHidden = true
            setStatusLabel()
        }
    }
    
    public func setStatusLabel() {
        if score == 100 {
            statusMedalLabel.text = "🥇"
            statusTextLabel.text = "You are a master trash-sorter!"
        }
        else if (score > 0) && (score < 100) {
            statusMedalLabel.text = "🥈"
            statusTextLabel.text = "You are a developing trash-sorter!"
        }
        else  {
            statusMedalLabel.text = "🥉"
            statusTextLabel.text = "You are a novice trash-sorter!"
        }
    }
    
    public func throwItem(binName: String) {
        let currentItem = itemList[currentitemIndex]
        let currentItemNode = childNode(withName: currentItem)
        
        // universal actions
        let fadeOutAction = SKAction.fadeOut(withDuration: 1.25)
        let removeAction = SKAction.removeFromParent()
        
        let rotateLeftAction = SKAction.rotate(byAngle: 1, duration: 0.25)
        let rotateRightAction = SKAction.rotate(byAngle: -1, duration: 0.25)
        let scaleAction = SKAction.scale(by: 0.25, duration: 0.25)

        if binName == "greenBin" {
            let moveAction = SKAction.moveBy(x: -38, y: 315, duration: 0.25)
            
            let throwAction = SKAction.group([moveAction, scaleAction, rotateLeftAction, fadeOutAction])
            let sequence = SKAction.sequence([throwAction, removeAction])
            currentItemNode!.run(sequence)
        }
        if binName == "blueBin" {
            let moveAction = SKAction.moveBy(x: -120, y: 315, duration: 0.25)
            
            let throwAction = SKAction.group([moveAction, scaleAction, rotateLeftAction, fadeOutAction])
            let sequence = SKAction.sequence([throwAction, removeAction])
            currentItemNode!.run(sequence)
        }
        if binName == "blackBin" {
            let moveAction = SKAction.moveBy(x: 120, y: 315, duration: 0.25)

            let throwAction = SKAction.group([moveAction, scaleAction, rotateRightAction, fadeOutAction])
            let sequence = SKAction.sequence([throwAction, removeAction])
            currentItemNode!.run(sequence)
        }
        if binName == "brownBin" {
            let moveAction = SKAction.moveBy(x: 45, y: 315, duration: 0.25)
            
            let throwAction = SKAction.group([moveAction, scaleAction, rotateRightAction, fadeOutAction])
            let sequence = SKAction.sequence([throwAction, removeAction])
            currentItemNode!.run(sequence)
        }

    }
    
    public func resetGame() {
        feedbackTitleLabel.isHidden = true
        feedbackTextLabel.isHidden = true
        playAgainLabel.isHidden = true
        itemTextLabel.isHidden = false
        score = 0
        scoreLabel.fontColor = SKColor.black
        scoreLabel.text = "\(score)"
        currentitemIndex = 0
        statusTextLabel.text = ""
        statusMedalLabel.text = ""
        generateItem()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = atPoint(location)
            if (node.name == "greenBin") ||
                (node.name == "blueBin") ||
                (node.name == "blackBin") ||
                (node.name == "brownBin"){
                    update(bin: node.name!)
            }
            if (node.name == "playAgainLabel") {
                resetGame()
            }
        }
    }
}
