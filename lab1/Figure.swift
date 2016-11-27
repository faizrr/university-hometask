//
//  Figure.swift
//  lab1
//
//  Created by Roman Faizullin on 23/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

protocol Figure {
    var layer: CAShapeLayer { get set }
    
    func show()
    func moveTo(dx: Int32, dy: Int32)
    func setRandomColor()
}
