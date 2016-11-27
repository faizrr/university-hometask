//
//  ViewController.swift
//  lab1
//
//  Created by Roman Faizullin on 02/10/2016.
//  Copyright © 2016 Roman Faizullin. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var canvas: NSImageView!
    
    @IBOutlet weak var figuresComboBox: NSComboBox!
    let figures = FiguresDataSource()
    
    @IBOutlet weak var dxField: NSTextField!
    @IBOutlet weak var dyField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCanvas()
        figuresComboBox.dataSource = figures
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: Simple tab related methods
    
    @IBAction func moveFigure(_ sender: AnyObject) {
        let index = figuresComboBox.indexOfSelectedItem
        let figureToMove = figures[index]
        
        figureToMove.moveTo(dx: dxField.intValue, dy: dyField.intValue)
    }
    
    @IBAction func moveAllFigures(_ sender: AnyObject) {
        for figure in figures {
            figure.moveTo(dx: dxField.intValue, dy: dyField.intValue)
        }
    }
    
    @IBAction func removeFigure(_ sender: AnyObject) {
        let indexOfFigureToDelete = figuresComboBox.indexOfSelectedItem
        
        figures.remove(at: indexOfFigureToDelete)
        canvas.layer?.sublayers?.remove(at: indexOfFigureToDelete)
    }
    
    @IBAction func changeColorAction(_ sender: AnyObject) {
        let index = figuresComboBox.indexOfSelectedItem
        figures[index].setRandomColor()
    }
    
    @IBAction func addCircleAction(_ sender: AnyObject) {
        addFigure(Circle())
    }
    
    @IBAction func addRectangleAction(_ sender: AnyObject) {
        addFigure(Rectangle())
    }
    
    @IBAction func addRingAction(_ sender: AnyObject) {
        addFigure(Ring())
    }
    
    @IBAction func addEllipseAction(_ sender: AnyObject) {
        addFigure(Ellipse())
    }
    
    @IBAction func addOlympicRingsAction(_ sender: AnyObject) {
        addFigure(OlympicRing())
    }
    
    private func addFigure(_ figure: Figure) {
        addFigureToCanvas(figure)
        figures.append(figure)
    }
    
    
    
    private func initializeCanvas () {
        canvas.layer = CALayer()
        canvas.layer?.masksToBounds = true
        canvas.layer?.backgroundColor = CGColor.white
    }
    
    private func addFigureToCanvas (_ figure: Figure) {
        canvas.layer?.addSublayer(figure.layer)
        figure.show()
    }
}
