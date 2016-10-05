//
//  FigureUtils.swift
//  lab1
//
//  Created by Roman Faizullin on 05/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import Foundation

protocol FigureUtils {
    func generateRandomColor() -> CGColor
}

extension FigureUtils {
    func generateRandomColor() -> CGColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return CGColor(red: hue, green: saturation, blue: brightness, alpha: 1)
    }
}
