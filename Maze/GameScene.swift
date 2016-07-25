//
//  GameScene.swift
//  Maze
//
//  Created by Ehsan Zaman on 7/20/16.
//  Copyright (c) 2016 Ehsan Zaman. All rights reserved.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let manager = CMMotionManager()
    var jon = SKSpriteNode()
    var goal = SKSpriteNode()
    var dragons: [SKSpriteNode] = []
    
   // let dragonSpeed: CGFloat = 50.0
   //let jonSpeed: CGFloat = 300.0
   //var lastTouch: CGPoint? = nil
    
    override func didMoveToView(view: SKView) {
        
        self.physicsWorld.contactDelegate = self
        
        jon = self.childNodeWithName("jon") as! SKSpriteNode
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.05
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 8, CGFloat((data?.acceleration.y)!) * 8)
        
        }
        
        
        goal = self.childNodeWithName("goal") as! SKSpriteNode
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        var bodyA = contact.bodyA
        var bodyB = contact.bodyB
       
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
