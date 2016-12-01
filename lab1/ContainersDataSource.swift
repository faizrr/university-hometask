//
//  ContainersDataSource.swift
//  lab1
//
//  Created by Roman Faizullin on 27/11/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

class ContainersDataSource: NSObject, Sequence, NSComboBoxDelegate, NSComboBoxDataSource {
    private var figureContainers = [FigureContainer]()
    
    func append(_ f: FigureContainer){
        figureContainers.append(f)
    }
    
    func remove(at: Int) {
        figureContainers.remove(at: at)
    }
    
    subscript(index: Int) -> FigureContainer {
        get {
            return figureContainers[index]
        }
        
        set(newValue) {
            figureContainers[index] = newValue
        }
    }
    
    // ComboBox related methods
    
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return figureContainers.count
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return "Container #\(index + 1)"
    }
    
    // Iterator related methods
    
    func makeIterator () -> IndexingIterator<Array<FigureContainer>> {
        return figureContainers.makeIterator()
    }
}
