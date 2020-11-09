//
//  BoardView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-07.
//

import Cocoa

class BoardView: NSView {
    let cols: Int = 7
    let rows: Int = 6
    
    
    let boardX: CGFloat = 30
    let boardY: CGFloat = 20
    let cellSide: CGFloat = 70
    let radius: CGFloat = 25

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        drawBoard()
        
        drawGrid()
    }
    
    func drawBoard() {
        #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).setFill()
//        NSBezierPath(roundedRect: bounds, xRadius: 20, yRadius: 20).fill()
        NSBezierPath(rect: bounds).fill()
        
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
//        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setStroke()
//        NSBezierPath(rect: circleRect).stroke()
        
        let path = NSBezierPath(ovalIn: circleRect)
        #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
        path.fill()
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()

    }
    
    private func drawGrid() {
        let cellWidth: CGFloat = bounds.width / CGFloat(cols)
        let cellHeight: CGFloat = bounds.height / CGFloat(rows)
        
        let grid = NSBezierPath()
        
        for col in 1..<cols {
            grid.move(to: NSPoint(x: CGFloat(col) * cellWidth, y: 0))
            grid.line(to: NSPoint(x: CGFloat(col) * cellWidth, y: bounds.height))
        }
        
        for row in 1..<rows {
            grid.move(to: NSPoint(x: 0, y: CGFloat(row) * cellHeight))
            grid.line(to: NSPoint(x: bounds.width, y: CGFloat(row) * cellHeight))
        }
        
        
        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setStroke()
        grid.stroke()
    }
}
