//
//  GameScene.swift
//  mamama
//
//  Created by yuya yano on 2015/01/20.
//  Copyright (c) 2015年 yuya yano. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        //myLabel.text = "";
        //myLabel.fontSize = 25;
        //myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        //self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        //for touch: AnyObject in touches {
            //let location = touch.locationInNode(self)
            //let sprite = SKSpriteNode(color:SKColor.blueColor(), size:CGSizeMake(200, 200))
            //sprite.xScale = 0.5
            //sprite.yScale = 0.5
            //sprite.position = location
            //let rot = SKAction.rotateByAngle(CGFloat(M_PI*5), duration:5)
            //let moveY = SKAction.moveToY(-100, duration: 5)
            //sprite.runAction(SKAction.repeatActionForever(SKAction.group([moveY, rot])))
            //self.addChild(sprite)
        //}
    }
    
    func choiceColor() -> UIColor {
        let r = arc4random_uniform(8)
        if r == 0 {
            return SKColor.blueColor()
        }
        else if r == 1 {
            return SKColor.brownColor()
        }
        else if r == 2 {
            return SKColor.greenColor()
        }
        else if r == 3 {
            return SKColor.magentaColor()
        }
        else if r == 4 {
            return SKColor.purpleColor()
        }
        else if r == 5 {
            return SKColor.redColor()
        }
        else if r == 6 {
            return SKColor.yellowColor()
        }
        return SKColor.yellowColor()
    }
    
    func shootingStar() {
        var r_size = arc4random_uniform(5)
        var r_pos = arc4random_uniform(UInt32(CGRectGetWidth(self.frame)))
        var r_speed = arc4random_uniform(30) + 1

        var pts = [CGPoint(x: 0.0, y: 0.0), CGPoint(x: 24, y: 74), CGPoint(x: 99, y: 76), CGPoint(x: 40, y: 121), CGPoint(x: 60, y: 196), CGPoint(x: 0, y: 152), CGPoint(x: -60, y: 196), CGPoint(x: -40, y: 121), CGPoint(x: -99, y: 76), CGPoint(x: -24, y: 74), CGPoint(x: 0.0, y: 0.0)]
        let star = SKShapeNode(points: &pts, count: UInt(pts.count))
        star.position = CGPoint(x:CGFloat(r_pos), y:0);
        let color = self.choiceColor()
        star.fillColor = color
        star.strokeColor = color
        star.xScale = 0.1 * CGFloat(r_size) + 0.2
        star.yScale = 0.1 * CGFloat(r_size) + 0.2
        
        let rot = SKAction.rotateByAngle(CGFloat(M_PI)*CGFloat(r_speed), duration: Double(r_speed))
        let moveY = SKAction.moveToY(CGRectGetHeight(self.frame)+1000, duration: Double(r_speed))
        star.runAction(SKAction.repeatActionForever(SKAction.group([moveY, rot])))
        
        self.addChild(star)
    }
    
    var last : CFTimeInterval!
   
    override func update(currentTime: CFTimeInterval) {
        
        // 各種乱数
        var r_time = Double(arc4random_uniform(8)+2)
        
        if last == nil {
            last = currentTime
        }
        
        if last + r_time <= currentTime {
            self.shootingStar()
        }
    }
}
