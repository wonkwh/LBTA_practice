//
//  CanvasView.swift
//  DrawPad
//
//  Created by wonkwh on 21/01/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    
    private var lines = [[CGPoint]]()
    fileprivate var strokeColor = UIColor.black.cgColor
    fileprivate var lineWidth: CGFloat  = 1.0
    
    override func draw(_ rect: CGRect) {
        //custom drawing
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        //        let startPoint = CGPoint(x: 0, y: 0)
        //        let endPoint = CGPoint(x: 100, y: 100)
        //
        //        context.move(to: startPoint)
        //        context.addLine(to: endPoint)
        
        context.setStrokeColor(strokeColor)
        context.setLineWidth(lineWidth)
        context.setLineCap(.round)
        
        
        lines.forEach { (line) in
            for (index, point) in line.enumerated() {
                if index == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
        }
        
        context.strokePath()
    }
    
    //track the finger
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: nil) else { return }
        
        guard var lastLine = lines.popLast() else { return }
        
        lastLine.append(point)
        lines.append(lastLine)
        //lines.append(point)
        setNeedsDisplay()
    }
    
    func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func setStrokeColor(color: UIColor) {
        strokeColor = color.cgColor
    }
    
    func setStrokeWidth(width: CGFloat) {
        lineWidth = width
    }
}
