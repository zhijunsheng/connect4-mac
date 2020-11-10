//
//  ViewController.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-07.
//

import Cocoa

class ViewController: NSViewController {

    var conn4Board = Conn4Board()
    
    @IBOutlet weak var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        conn4Board.dropPieceAt(col: 2)
        boardView.shadowPiecesBox = conn4Board.piecesBox
        boardView.setNeedsDisplay(boardView.bounds)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

