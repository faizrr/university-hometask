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
    @IBOutlet weak var circleComboBox: NSComboBox!
    
    @IBOutlet weak var dxField: NSTextField!
    @IBOutlet weak var dyField: NSTextField!
    
    var circles = [Circle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCanvas()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addCircleAction(_ sender: AnyObject) {
        let circle = Circle()
        
        addCircle(circle: circle)
    }
    
    @IBAction func moveCircle(_ sender: AnyObject) {
        let index = circleComboBox.indexOfSelectedItem
        let circleToMove = circles[index]
        
        circleToMove.moveTo(dx: dxField.intValue, dy: dyField.intValue)
    }
    
    @IBAction func moveAllCircles(_ sender: AnyObject) {
        for circle in circles {
            circle.moveTo(dx: dxField.intValue, dy: dyField.intValue)
        }
    }
    
    @IBAction func removeCircle(_ sender: AnyObject) {
        circles.remove(at: circleComboBox.indexOfSelectedItem)
        canvas.layer?.sublayers?.remove(at: circleComboBox.indexOfSelectedItem)
        circleComboBox.removeItem(at: circleComboBox.indexOfSelectedItem)
    }
    
    @IBOutlet weak var newCircleX: NSTextField!
    @IBOutlet weak var newCircleY: NSTextField!
    @IBOutlet weak var newCircleR: NSTextField!
    @IBAction func addCustomCirle(_ sender: AnyObject) {
        do {
            let newCircle = try Circle(x: newCircleX.intValue, y: newCircleY.intValue, r: newCircleR.intValue)
            addCircle(circle: newCircle)
            print(newCircle.layer.frame)
        } catch {
            print("Incorrect X, Y or R")
        }
        
    }

    @IBAction func addRectangle(_ sender: AnyObject) {
        let rect = Rectangle()
        
        addRectangleToCanvas(rectangle: rect)
        rect.show()
    }
    
    private func initializeCanvas () {
        canvas.layer = CALayer()
        canvas.layer?.masksToBounds = true
        canvas.layer?.backgroundColor = CGColor.white
    }
    
    private func addRectangleToCanvas (rectangle: Rectangle) {
        canvas.layer?.addSublayer(rectangle.layer)
    }
    
    private func addCircle (circle: Circle) {
        canvas.layer?.addSublayer(circle.layer)
        circle.show()
        
        circles.append(circle)
        
        circleComboBox.addItem(withObjectValue: "Circle \(circles.count)")
    }
}
