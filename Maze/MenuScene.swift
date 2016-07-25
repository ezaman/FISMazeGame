//
//  MenuScene.swift
//  Maze
//
//  Created by Ehsan Zaman on 7/24/16.
//  Copyright © 2016 Ehsan Zaman. All rights reserved.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        
        let label = SKLabelNode(text: "Winter is here. Try Again.")
        label.fontName = "AvenirNext-Bold"
        label.fontSize = 55
        label.fontColor = UIColor.whiteColor()
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))

        self.addChild(label)
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let gameScene = GameScene(fileNamed: "GameScene")
        let transition = SKTransition.flipVerticalWithDuration(1.0)
        let skView = self.view as SKView!
        gameScene?.scaleMode = .AspectFill
        skView.presentScene(gameScene!, transition: transition)
    }
    
}
