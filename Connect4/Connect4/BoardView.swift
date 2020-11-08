//
//  BoardView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-07.
//

import Cocoa

class BoardView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.white.setFill()
        bounds.fill()
        
        let circleRect = NSRect(x: 30, y: 20, width: 50, height: 50)
        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
        NSBezierPath(rect: circleRect).stroke()
        
        let path = NSBezierPath(ovalIn: circleRect)
        #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).setStroke()
        path.stroke()
    }
    
}
