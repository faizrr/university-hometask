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

    @IBAction func addCircle(_ sender: AnyObject) {
        let circle = Circle()
        
        addCircleToCanvas(circle: circle)
        circle.show()
        
        circles.append(circle)
        
        circleComboBox.addItem(withObjectValue: "Circle \(circles.count)")
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
    
    @IBAction func increaseCircleSize(_ sender: AnyObject) {
        circles[circleComboBox.indexOfSelectedItem].radius += 2.0
    }
    
    private func initializeCanvas () {
        canvas.layer = CALayer()
        canvas.layer?.masksToBounds = true
        canvas.layer?.backgroundColor = CGColor.white
    }
    
    private func addCircleToCanvas (circle: Circle) {
        canvas.layer?.addSublayer(circle.layer)
    }
}
