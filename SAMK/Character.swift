//
//  Character.swift
//  SAMK
//
//  Created by Katlyn Schwaebe on 9/22/14.
//  Copyright (c) 2014 Katlyn Schwaebe. All rights reserved.
//

import UIKit
import SpriteKit

class Character: NSObject {
    
    var scene: GameScene!
    var body: SKSpriteNode!
    var direction: CGFloat = 1.0 // right
    var textureNames: [String] = []
    
    init (animal:String) {
        super.init()
        
        var characterAtlas = SKTextureAtlas(named: animal)
        textureNames = sorted(characterAtlas.textureNames as [String],<)
        
        body = SKSpriteNode(imageNamed: textureNames[0] as String)
        body.size = CGSizeMake(54, 116)
        //body.fillColor = UIColor.whiteColor()
        body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
        //body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
    }
    func moveLeft()
    {
        direction = -1
        body.physicsBody?.applyImpulse(CGVectorMake(-30, 0.0))
        
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: false, restore: true)
        body.runAction(walkAction)
        body.xScale = direction
    }
    func moveRight()
    {
        direction = 1
        body.physicsBody?.applyImpulse(CGVectorMake(30, 0.0))
        
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: false, restore: true)
        body.runAction(walkAction)
        body.xScale = direction
    }
    func jump()
    {
        body.physicsBody?.applyImpulse(CGVectorMake(0.0, 50.0))
    }
    func fire()
    {
        var particlePath = NSBundle.mainBundle().pathForResource("MyParticle", ofType: "sks")
        var sceneData = NSData.dataWithContentsOfFile(particlePath!, options: .DataReadingMappedIfSafe, error: nil)
        var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
        
        archiver.setClass(SKEmitterNode.self, forClassName: "SKEditorScene")
        let node = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKEmitterNode?
        archiver.finishDecoding()
        
        var kamehameha = node!
        kamehameha.position = CGPointMake(body.position.x + 50 * direction, body.position.y)
        kamehameha.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        kamehameha.physicsBody?.affectedByGravity = false
        
        //scene.addChild(kamehameha)
        body.parent?.addChild(kamehameha)
        
        kamehameha.physicsBody?.applyImpulse(CGVectorMake(200.0 * direction, 0.0))
        body.physicsBody?.applyImpulse(CGVectorMake(-20.0 * direction, 0.0))
    }
    func texturesFromNames() -> [SKTexture] {
        var textures: [SKTexture] = []
        for textureName in textureNames {
            textures.append(SKTexture(imageNamed: textureName))
        
        }
        return textures
    }
    
}
