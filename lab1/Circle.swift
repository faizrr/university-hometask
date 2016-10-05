//
//  Circle.swift
//  lab1
//
//  Created by Roman Faizullin on 02/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate struct circleDefaults {
    static let width:CGFloat = 50.0
    static let height:CGFloat = 50.0
    static let lineWidth:CGFloat = 2.0
}

class Circle {
    var layer = CAShapeLayer()
    var center = CGPoint()
    var radius = CGFloat()
    
    init () {
        let x = CGFloat(arc4random_uniform(UInt32(canvasDefaults.width - circleDefaults.width))) / (NSScreen.main()?.backingScaleFactor)!
        let y = CGFloat(arc4random_uniform(UInt32(canvasDefaults.height - circleDefaults.height))) / (NSScreen.main()?.backingScaleFactor)!
        
        layer.frame = CGRect(x: x, y: y, width: circleDefaults.width, height: circleDefaults.height)
        layer.lineWidth = circleDefaults.lineWidth
        layer.fillColor = self.generateRandomColor()
        layer.path = CGPath(ellipseIn: layer.frame, transform: nil)
        layer.isHidden = true
        
        radius = circleDefaults.width / 2
        center = CGPoint(x: x + radius, y: y + radius)
    }
    
    convenience init (x: CGFloat, y: CGFloat) {
        self.init()
        layer.frame = CGRect(x: x, y: y, width: circleDefaults.width, height: circleDefaults.height)
    }
    
    func show () {
        layer.isHidden = false
    }
    
    func moveTo (dx: Int32, dy: Int32) {
        layer.position = CGPoint(x: layer.position.x + CGFloat(dx), y: layer.position.y + CGFloat(dy))
    }
}

extension Circle: FigureUtils {}
