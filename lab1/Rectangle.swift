//
//  Rectangle.swift
//  lab1
//
//  Created by Roman Faizullin on 05/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate struct rectangleDefaults {
    static let width:CGFloat = 25.0
    static let height:CGFloat = 60.0
}

class Rectangle {
    var layer = CAShapeLayer()
    var leftUpperCorner = CGPoint()
    var width = CGFloat()
    var height = CGFloat()
    
    init () {
        let zeroPoint = generatePoint(rectangleDefaults.width, rectangleDefaults.height)
        
        layer.fillColor = self.generateRandomColor()
        layer.frame = CGRect(x: zeroPoint.x, y: zeroPoint.y, width: rectangleDefaults.width, height: rectangleDefaults.height)
        layer.path = CGPath(rect: layer.frame, transform: nil)
        layer.isHidden = true
        
        width = rectangleDefaults.width
        height = rectangleDefaults.height
        leftUpperCorner = CGPoint(x: zeroPoint.x + width, y: zeroPoint.y + height)
    }
    
    convenience init (width: CGFloat, height: CGFloat) {
        self.init()
    }
}

extension Rectangle: FigureUtils {}
