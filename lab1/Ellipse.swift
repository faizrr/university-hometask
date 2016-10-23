//
//  Ellipse.swift
//  lab1
//
//  Created by Roman Faizullin on 23/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate struct ellipseDefaults {
    static let r1:CGFloat = 25.0
    static let r2:CGFloat = 15.0
}

class Ellipse: Figure {
    var layer = CAShapeLayer()
    var r1 = CGFloat()
    var r2 = CGFloat()
    
    init () {
        let color = self.generateRandomColor()
        let frameWidth = ellipseDefaults.r1 * 2
        let frameHeight = ellipseDefaults.r2 * 2
        
        let zeroPoint = generatePoint(frameWidth, frameHeight)
        
        layer.frame = CGRect(x: zeroPoint.x, y: zeroPoint.y, width: frameWidth, height: frameHeight)
        layer.fillColor = color
        layer.path = CGPath(ellipseIn: layer.frame, transform: nil)
        layer.isHidden = true
    }
}

extension Ellipse: FigureUtils {}
