//
//  Conn4Board.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-09.
//

import Foundation

struct Conn4Board {
    var piecesBox: [Conn4Piece] = []
    
    mutating func dropPieceAt(col: Int) {
        piecesBox.append(Conn4Piece(col: col, row: 0, player: Conn4Player.red))
    }
}
