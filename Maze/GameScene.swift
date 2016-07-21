//
//  GameScene.swift
//  Maze
//
//  Created by Ehsan Zaman on 7/20/16.
//  Copyright (c) 2016 Ehsan Zaman. All rights reserved.
//

import SpriteKit
import CoreMotion
///
class GameScene: SKScene {
    
    let manager = CMMotionManager()
    
    override func didMoveToView(view: SKView) {
        
        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.05
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()){
            (data, error) in
            
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!) * 20, CGFloat((data?.acceleration.y)!) * 20)
        }
        
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
