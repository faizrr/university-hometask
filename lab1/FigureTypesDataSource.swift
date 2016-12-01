//
//  FigureTypesDataSource.swift
//  lab1
//
//  Created by Roman Faizullin on 27/11/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import AppKit

class FigureTypesDataSource: NSObject, NSComboBoxDelegate, NSComboBoxDataSource {
    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return FIGURES_NAMES.count
    }
    
    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
        return FIGURES_NAMES[index]
    }
}
