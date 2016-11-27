//
//  Circle.swift
//  lab1
//
//  Created by Roman Faizullin on 02/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate struct circleDefaults {
    static let radius:CGFloat = 25.0
    static let lineWidth:CGFloat = 2.0
}

class Circle: Figure {
    var layer = CAShapeLayer()
    var center: CGPoint = CGPoint() {
        didSet {
            layer.position = CGPoint(x: center.x - radius, y: center.y - radius)
        }
    }
    var radius: CGFloat = 0.0 {
        didSet {
            layer.frame.size = CGSize(width: radius * 2, height: radius * 2)
            layer.path = CGPath(ellipseIn: layer.frame, transform: nil)
        }
    }
    
    init () {
        let frameWidth = circleDefaults.radius * 2
        let frameHeight = frameWidth
        
        let zeroPoint = generatePoint(frameWidth, frameHeight)
        
        layer.frame = CGRect(x: zeroPoint.x, y: zeroPoint.y, width: frameWidth, height: frameHeight)
        layer.lineWidth = circleDefaults.lineWidth
        layer.path = CGPath(ellipseIn: layer.frame, transform: nil)
        layer.isHidden = true
        
        radius = circleDefaults.radius
        center = CGPoint(x: zeroPoint.x + radius, y: zeroPoint.y + radius)
        
        setRandomColor()
    }
    
    convenience init (x: Int32, y: Int32, r: Int32) throws {
        self.init()
        
        let newOrigin = CGPoint(x: CGFloat(x), y: CGFloat(y))
        let newSize = CGSize(width: CGFloat(r) * 2, height: CGFloat(r) * 2)
        try self.checkPoint(pointToCheck: newOrigin, figureSize: newSize)
        layer.frame = CGRect(origin: newOrigin, size: newSize)

        defer {
            radius = CGFloat(r)
        }
    }
}

extension Circle: FigureUtils {}
