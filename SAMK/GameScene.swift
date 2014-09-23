//
//  GameScene.swift
//  SAMK
//
//  Created by Katlyn Schwaebe on 9/22/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player1 = Character()
    var player2 = Character()
    
    override func didMoveToView(view: SKView) {
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        
        var floor = SKShapeNode(rectOfSize: CGSizeMake(SCREEN_WIDTH, 10))
        floor.fillColor = UIColor.darkGrayColor()
        floor.position = CGPointMake(SCREEN_WIDTH / 2.0, 5)
        
        floor.physicsBody = SKPhysicsBody(rectangleOfSize: floor.frame.size)
        floor.physicsBody?.affectedByGravity = false
        floor.physicsBody?.dynamic = false
        
        //floor.physicsBody = SKPhysicsBody(edgeLoopFromRect: floor.frame)
        //floor.physicsBody?.collisionBitMask = 1
        
        player1.body.position = CGPointMake(100, 100)
        self.addChild(player1.body)
        
        self.addChild(floor)
        
        
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        println(contact.bodyA)
        println(contact.bodyB)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
