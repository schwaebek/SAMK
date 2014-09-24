//
//  GameScene.swift
//  SAMK
//
//  Created by Katlyn Schwaebe on 9/22/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player1 = Character(animal: "bunny")
    var player2 = Character(animal: "panda")
    
    var sun = SKSpriteNode(imageNamed: "sun")
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor(red:0.078, green:0.827, blue:0.949, alpha:1.0)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        
        sun.size = CGSizeMake(SCREEN_HEIGHT, SCREEN_HEIGHT)
        sun.position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)
        self.addChild(sun)
        
        var bg = SKSpriteNode(imageNamed: "bg_front")
        bg.size = self.size
        bg.position = sun.position
        self.addChild(bg)
        
        player1.body.position = CGPointMake(100, 100)
        self.addChild(player1.body)
        
        player2.body.position = CGPointMake(100, 100)
        self.addChild(player2.body)
        
        var floor = SKShapeNode(rectOfSize: CGSizeMake(SCREEN_WIDTH, 10))
        floor.fillColor = UIColor.darkGrayColor()
        floor.position = CGPointMake(SCREEN_WIDTH / 2.0, 5)
        
        floor.physicsBody = SKPhysicsBody(rectangleOfSize: floor.frame.size)
        floor.physicsBody?.affectedByGravity = false
        floor.physicsBody?.dynamic = false
        
        //floor.physicsBody = SKPhysicsBody(edgeLoopFromRect: floor.frame)
        //floor.physicsBody?.collisionBitMask = 1
        
        //listens for intersections
        //player1.body.physicsBody?.contactTestBitMask = 1
        self.addChild(floor)
        
        var floor1 = SKSpriteNode (imageNamed: "cloud")
        floor1.size = CGSizeMake(212, 55)
        floor1.position = CGPointMake(SCREEN_WIDTH / 2.0, 120)
        
        floor1.physicsBody = SKPhysicsBody(rectangleOfSize: floor.frame.size)
        floor1.physicsBody?.affectedByGravity = false
        floor1.physicsBody?.dynamic = false
        
        self.addChild(floor1)
        
        
        
    }
    func didBeginContact(contact: SKPhysicsContact) {
        println(contact.bodyA)
        println(contact.bodyB)
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        sun.zRotation += 0.01
        /* Called before each frame is rendered */
    }
}
