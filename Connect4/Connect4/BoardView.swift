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
    
    var cellSide: CGFloat = -1
    
    var shadowPiecesBox: [Conn4Piece] = []
    var conn4Delegate: Conn4Delegate?

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        cellSide = bounds.width / 7
        
        drawBoard()
        drawPieces()
    }
    
    override func mouseUp(with event: NSEvent) {
        let loc = convert(event.locationInWindow, from: nil)
        let col: Int = Int(loc.x / cellSide)
        conn4Delegate?.dropPieceAt(col: col)
    }
    
    func drawPieces() {
        for piece in shadowPiecesBox {
            let fillingColor: NSColor = (piece.player == Conn4Player.red) ? NSColor.red : NSColor.yellow
            
            drawCircleAt(col: piece.col, row: piece.row, fillingColor: fillingColor)
        }
    }
    
    func drawBoard() {
        let cornerRadius = 0.35 * cellSide
        
        #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).setFill()
        NSBezierPath(roundedRect: bounds, xRadius: cornerRadius, yRadius: cornerRadius).fill()
        
        for row in 0..<6 {
            for col in 0..<7 {
                drawCircleAt(col: col, row: row, fillingColor: NSColor.white)
            }
        }
    }
    
    func drawCircleAt(col: Int, row: Int, fillingColor: NSColor) {
        let radius = 0.35 * cellSide
        let offsetX = (bounds.width / 7 - 2 * radius) / 2
        let offsetY = (bounds.height / 6 - 2 * radius) / 2
        drawCircle(x: CGFloat(col) * cellSide + offsetX, y: CGFloat(row) * cellSide + offsetY, radius: radius, fillingColor: fillingColor)
    }
    
    func drawCircle(x: CGFloat, y: CGFloat, radius: CGFloat, fillingColor: NSColor) {
        let circleRect = NSRect(x: x, y: y, width: 2 * radius, height: 2 * radius)
//        #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).setStroke()
//        NSBezierPath(rect: circleRect).stroke()
        
        let path = NSBezierPath(ovalIn: circleRect)
        fillingColor.setFill()
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
