//
//  BoardView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-07.
//

import Cocoa

class BoardView: NSView {
    let boardX: CGFloat = 30
    let boardY: CGFloat = 20
    let cellSide: CGFloat = 70
    let radius: CGFloat = 25

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.white.setFill()
        bounds.fill()
        
        for row in 0..<6 {
            for col in 0..<7 {
                drawCircleAt(col: col, row: row)
            }
        }
    }
    
    func drawCircleAt(col: Int, row: Int) {
        drawCircle(x: boardX + CGFloat(col) * cellSide, y: boardY + CGFloat(row) * cellSide, radius: radius)
    }
    
    func drawCircle(x: CGFloat, y: CGFloat, radius: CGFloat) {
        let circleRect = NSRect(x: x, y: y, width: 2 * radius, height: 2 * radius)
//        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
//        NSBezierPath(rect: circleRect).stroke()
        
        let path = NSBezierPath(ovalIn: circleRect)
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
    }
    
}
