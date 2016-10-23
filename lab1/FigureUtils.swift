//
//  FigureUtils.swift
//  lab1
//
//  Created by Roman Faizullin on 05/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

enum PointError: String, Error {
    case InvalidPoint = "Point is incorrect, because figure goes beyond the canvas"
}

protocol FigureUtils: Figure {
    func generateRandomColor() -> CGColor
    func generatePoint (_ figureWidth: CGFloat, _ figureHeight: CGFloat) -> CGPoint
}

extension FigureUtils {
    func show () {
        layer.isHidden = false
    }
    
    func moveTo (dx: Int32, dy: Int32) {
        layer.position = CGPoint(x: layer.position.x + CGFloat(dx), y: layer.position.y + CGFloat(dy))
    }
    
    func generateRandomColor() -> CGColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return CGColor(red: hue, green: saturation, blue: brightness, alpha: 1)
    }
    
    func generatePoint (_ figureWidth: CGFloat, _ figureHeight: CGFloat) -> CGPoint {
        let x = CGFloat(arc4random_uniform(UInt32(canvasDefaults.width - figureWidth))) / (NSScreen.main()?.backingScaleFactor)!
        let y = CGFloat(arc4random_uniform(UInt32(canvasDefaults.height - figureHeight))) / (NSScreen.main()?.backingScaleFactor)!
        
        return CGPoint(x: x, y: y)
    }
    
    func checkPoint (pointToCheck: CGPoint, figureSize: CGSize) throws {
        let x = pointToCheck.x * (NSScreen.main()?.backingScaleFactor)!
        let y = pointToCheck.y * (NSScreen.main()?.backingScaleFactor)!
        let width = figureSize.width
        let height = figureSize.height
        
        if (x + width > canvasDefaults.width) {
            throw PointError.InvalidPoint
        } else if (y + height > canvasDefaults.height) {
            throw PointError.InvalidPoint
        } else if (x < 0 || y < 0) {
            throw PointError.InvalidPoint
        }
    }
}
