//
//  SimpleDataSource.swift
//  lab1
//
//  Created by Roman Faizullin on 27/11/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

class FiguresDataSource: NSObject, Sequence, NSComboBoxDelegate, NSComboBoxDataSource {
    private var figures = [Figure]()
    
    func append(_ f: Figure){
        figures.append(f)
    }
    
    func remove(at: Int) {
        figures.remove(at: at)
    }
    
    subscript(index: Int) -> Figure {
        get {
            return figures[index]
        }
        
        set(newValue) {
            figures[index] = newValue
        }
    }
    
    // ComboBox related methods
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return figures.count
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        let figureType = String(describing: type(of: figures[index]))
        return "Figure #\(index + 1) (\(figureType))"
    }
    
    // Iterator related methods
    
    func makeIterator () -> IndexingIterator<Array<Figure>> {
        return figures.makeIterator()
    }
}
