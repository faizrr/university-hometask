//
//  FigureContainer.swift
//  lab1
//
//  Created by Roman Faizullin on 27/11/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

fileprivate let NUM_OF_ELEMENTS = 50

class FigureContainer {
    var figures = [Figure]()
    
    var layer = CAShapeLayer()
    
    var isHidden: Bool {
        get {
            return layer.isHidden
        }
    }
    
    init () {
        generateFigures()
        addFiguresToLayer()
        hide()
    }
    
    func hide () {
        layer.isHidden = true
    }
    
    func show () {
        layer.isHidden = false
    }
    
    func moveTo (dx: Int32, dy: Int32) {
        layer.position = CGPoint(x: layer.position.x + CGFloat(dx), y: layer.position.y + CGFloat(dy))
    }
    
    func hideFigures(_ figureType: Figure.Type) {
        for f in figures {
            if (type(of: f) == figureType) {
                f.hide()
            }
        }
    }
    
    func showFigures(_ figureType: Figure.Type) {
        for f in figures {
            if (type(of: f) == figureType) {
                f.show()
            }
        }
    }
    
    func moveFigures(_ figureType: Figure.Type, dx: Int32, dy: Int32) {
        for f in figures {
            if (type(of: f) == figureType) {
                f.moveTo(dx: dx, dy: dy)
            }
        }
    }
    
    func changeFiguresColor (_ figureType: Figure.Type) {
        for f in figures {
            if (type(of: f) == figureType) {
                f.setRandomColor()
            }
        }
    }
    
    private func generateFigures () {
        for _ in 0...(NUM_OF_ELEMENTS - 1) {
            let randomIndex = Int(arc4random_uniform(UInt32(FIGURES_NAMES.count)))
            let figureName = FIGURES_NAMES[randomIndex]
            
            switch figureName {
            case "Circle":
                figures.append(Circle())
            case "Rectangle":
                figures.append(Rectangle())
            case "Ellipse":
                figures.append(Ellipse())
            case "Ring":
                figures.append(Ring())
            default:
                continue
            }
        }
    }
    
    private func addFiguresToLayer () {
        for f in figures {
            layer.addSublayer(f.layer)
            f.show()
        }
    }
}
