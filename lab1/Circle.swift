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
        let zeroPoint = generatePoint(circleDefaults.width, circleDefaults.height)
        
        layer.frame = CGRect(x: zeroPoint.x, y: zeroPoint.y, width: circleDefaults.width, height: circleDefaults.height)
        layer.lineWidth = circleDefaults.lineWidth
        layer.fillColor = self.generateRandomColor()
        layer.path = CGPath(ellipseIn: layer.frame, transform: nil)
        layer.isHidden = true
        
        radius = circleDefaults.width / 2
        center = CGPoint(x: zeroPoint.x + radius, y: zeroPoint.y + radius)
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
