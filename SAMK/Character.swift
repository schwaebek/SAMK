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
    
    var body: SKShapeNode!
    var direction: CGFloat = 1.0 // right
    
    
    override init() {
        super.init()
        
        body = SKShapeNode(rectOfSize: CGSizeMake(40, 70))
        body.fillColor = UIColor.whiteColor()
        body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
        //body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
    }
   
}
