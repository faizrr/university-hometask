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
    
    @IBOutlet weak var containersComboBox: NSComboBox!
    let containers = ContainersDataSource()
    @IBOutlet weak var figureTypesComboBox: NSComboBox!
    let figureTypes = FigureTypesDataSource()
    
    @IBOutlet weak var dxField: NSTextField!
    @IBOutlet weak var dyField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeCanvas()
        
        figuresComboBox.dataSource = figures
        
        containersComboBox.dataSource = containers
        figureTypesComboBox.dataSource = figureTypes
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
    
    
    private func addFigureToCanvas (_ figure: Figure) {
        canvas.layer?.addSublayer(figure.layer)
        figure.show()
    }
    
    // MARK: containers related methods
    
    @IBAction func addContainerAction(_ sender: Any) {
        let c = FigureContainer()
        containers.append(c)
        addContainerToCanvas(c)
    }
    
    @IBAction func toggleContainerVisibility(_ sender: Any) {
        let index = containersComboBox.indexOfSelectedItem
        let container = containers[index]
        
        if (container.isHidden) {
            container.show()
        } else {
            container.hide()
        }
    }
    
    @IBAction func moveContainer(_ sender: Any) {
        let index = containersComboBox.indexOfSelectedItem
        let container = containers[index]
        
        container.moveTo(dx: dxField.intValue, dy: dyField.intValue)
    }
    
    @IBAction func removeContainer(_ sender: Any) {
        let indexOfContainerToDelete = containersComboBox.indexOfSelectedItem
        
        containers.remove(at: indexOfContainerToDelete)
        canvas.layer?.sublayers?.remove(at: indexOfContainerToDelete)
    }
    
    @IBAction func moveFiguresInContainer(_ sender: Any) {
        let container = containers[containersComboBox.indexOfSelectedItem]
        
        container.moveFigures(getSelectedFigureType(), dx: dxField.intValue, dy: dyField.intValue)
    }
    
    @IBAction func changeFiguresColor(_ sender: Any) {
        let container = containers[containersComboBox.indexOfSelectedItem]
        
        container.changeFiguresColor(getSelectedFigureType())
    }

    @IBAction func showFigures(_ sender: Any) {
        let container = containers[containersComboBox.indexOfSelectedItem]
        
        container.showFigures(getSelectedFigureType())
    }
    
    @IBAction func hideFigures(_ sender: Any) {
        let container = containers[containersComboBox.indexOfSelectedItem]
        
        container.hideFigures(getSelectedFigureType())
    }
    
    private func addContainerToCanvas (_ container: FigureContainer) {
        canvas.layer?.addSublayer(container.layer)
        container.show()
    }
    
    private func getSelectedFigureType () -> Figure.Type {
        let className = FIGURES_NAMES[figureTypesComboBox.indexOfSelectedItem]
        
        switch className {
        case "Circle":
            return Circle.self
        case "Rectangle":
            return Rectangle.self
        case "Ellipse":
            return Ellipse.self
        case "Ring":
            return Ring.self
        default:
            return Circle.self
        }
    }
    
    
    private func initializeCanvas () {
        canvas.layer = CALayer()
        canvas.layer?.masksToBounds = true
        canvas.layer?.backgroundColor = CGColor.white
    }
    
}
