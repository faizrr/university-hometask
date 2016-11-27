//
//  OlympicRing.swift
//  lab1
//
//  Created by Roman Faizullin on 25/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate struct defaults {
    static let width:CGFloat = 100.0
    static let height:CGFloat = 50.0
}

class OlympicRing: Figure {
    var layer = CAShapeLayer()
    
    private var rings = [Ring]()
    
    init () {
        let zeroPoint = generatePoint(defaults.width, defaults.height)
        
        layer.frame = CGRect(x: zeroPoint.x, y: zeroPoint.y, width: defaults.width, height: defaults.height)
        layer.isHidden = false
        
        addCircles()
    }
    
    func changeRingColorAt(index: Int, color: CGColor) {
        rings[index].color = color
    }
    
    private func addCircles () {
        rings.append(Ring(x: 20.0, y: 20.0, visible: true))
        rings.append(Ring(x: 30.0, y: 20.0, visible: true))
        rings.append(Ring(x: 40.0, y: 20.0, visible: true))
        rings.append(Ring(x: 25.0, y: 10.0, visible: true))
        rings.append(Ring(x: 35.0, y: 10.0, visible: true))
        
        for ring in rings {
            layer.addSublayer(ring.layer)
        }
    }
}

extension OlympicRing: FigureUtils {}
