//
//  GameScene.swift
//  Maze
//
//  Created by Ehsan Zaman on 7/18/16.
//  Copyright (c) 2016 Ehsan Zaman. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var dany = SKSpriteNode()
    var goal = SKSpriteNode()
    //var dragons: [SKSpriteNode] = []
    
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        dany = self.childNodeWithName("dany") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 6, CGFloat((data?.acceleration.y)!) * 5)
        
        }
        
        goal = self.childNodeWithName("goal") as! SKSpriteNode
        
    }
    
//function for when the player makes contact with the end destination, the throne
    
    func didBeginContact(contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
       
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 || bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1 {
            gameOver(true)
        }else {
            gameOver(false)
        }
        
    }
    
    private func gameOver(didWin: Bool) {
        print("- - - Game Ended - - -")
        let menuScene = MenuScene(size: self.size)
        let transition = SKTransition.flipVerticalWithDuration(2.0)
        menuScene.scaleMode = SKSceneScaleMode.AspectFill
        self.scene!.view?.presentScene(menuScene, transition: transition)
    }
    
    
    override func update(currentTime: CFTimeInterval) {
     /* Called before each frame is rendered */
    }
}
